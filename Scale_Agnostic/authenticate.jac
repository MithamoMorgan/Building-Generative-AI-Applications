node User{
    has fname: str;
    has lname: str;
    has email: str;
    has password: str;
    has cpassword: str;
}

walker Signup{
    has fname: str;
    has lname: str;
    has email: str;
    has password: str;
    has cpassword: str;

    obj __specs__{
        static has methods : list = ["post"];
        static has auth : bool = False;
        static has summary: str = "Register a new user";
    }

    can entry with `root entry{
        # Ensure all information has been filled
        if not(self.fname and self.lname and self.email and self.password and self.cpassword){
            report{"Error":"Fill in all details"};
            return;
        }

        # Confirm password match
        if self.password != self.cpassword{
            report {"Error":"Password mismatch!"};
            return;
        }

        # Create node new_user and connect to root for persistence
        new_user = User(fname=self.fname, lname=self.lname, email=self.email, password=self.password, cpassword=self.cpassword);
        here ++> new_user;

        # Queue for persistence
        save(new_user);

        # Commit to database
        commit();

        # Display user details except the password
        report {
            "message" : "Account created successfully✅",
            "user" : {"Fname": self.fname, "Lname": self.lname, "Email": self.email}
        };

    }
}

# User login (POST /walker/login)
walker Login {
    has email: str;
    has password: str;

    obj __specs__ {
        static has methods: list = ["post"];
        static has auth: bool = False;
        static has summary: str = "Login user";
    }

    # Check if signup details match with login details
    can entry with `root entry{
        matched_users = [ user for user in [-->(`?User)] if (user.email == self.email) and (user.password == self.password) ];
        if len(matched_users) > 0 {
            user = matched_users[0];
            report {
                "message": "Login successful✅ ",
                "user": {"fname": user.fname, "lname": user.lname, "email": user.email}
            };
        } else {
            report {"error": "Invalid email or password!"};
        }
    }

}

