node User {
    has fname: str;
    has lname: str;
    has email: str;
    has password: str;
    has cpassword: str;
}

walker sign_up {
    has fname: str;
    has lname: str;
    has email: str;
    has password: str;
    has cpassword: str;

    obj __specs__ {
        static has methods: list = ["post"];
        static has auth: bool = False;
        static has summary: str = "Register a new user";
    }

    can entry with `root entry{
        # ensure all data is filled
        if not (self.fname and self.lname and self.email and self.password and self.cpassword){
            report  {"error": "Missing fname, lname, email or password"};
            return;
        }
        if self.password != self.cpassword{
            report  {"error": "password mismatch try again"};
            return;
        }
        # Create and connect to root so the node persists
        new_user = User(self.fname, self.lname, email=self.email, password=self.password, cpassword=self.cpassword) ;
        here ++> new_user;

        # Queue for persistence
        save(new_user);

        # Commit to database
        commit();

        # Do NOT return the password in the report
        report {
            "message": "✅ Account created successfully!",
            "user": {"fname": new_user.fname, "lname": new_user.lname, "email": new_user.email}
        };
    }    

}

# User login (POST /walker/login)
walker login {
    has email: str;
    has password: str;

    obj __specs__ {
        static has methods: list = ["post"];
        static has auth: bool = False;
        static has summary: str = "Login user";
    }

    can entry with `root entry {
        # Find all User nodes connected to root
        all_users = [-->(`?User)];

        # Search for a matching user
        matched_user = None;
        for user in all_users {
            if user.email == self.email and user.password == self.password {
                matched_user = user;
                break;
            }
        }

        if matched_user {
            report {
                "message": "✅ Login successful!",
                "user": {"fname": matched_user.fname, "lname": matched_user.lname, "email": matched_user.email}
            };
        } else {
            report {"error": "Invalid email or password!"};
        }
    }
}