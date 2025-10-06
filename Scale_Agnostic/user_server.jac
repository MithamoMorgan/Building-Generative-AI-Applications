# Use a capitalized archetype (matches docs' style)
node User {
    has name: str;
    has email: str;
    has password: str;
}

# Add user (POST /walker/add_user)
walker add_user {
    has name: str;
    has email: str;
    has password: str;

    obj __specs__ {
        static has methods: list = ["post"];
        static has auth: bool = False;
        static has summary: str = "Register a new user";
    }

    can create with `root entry {
        # Basic validation
        if not (self.name and self.email and self.password) {
            report {"error": "Missing name, email or password"};
            return;
        }

        # Create and connect to root so the node persists
        new_user = User(name=self.name, email=self.email, password=self.password);
        here ++> new_user;

        # Do NOT return the password in the report
        report {
            "message": "✅ User registered successfully!",
            "user": {"name": new_user.name, "email": new_user.email}
        };
    }
}

# Fetch all users (GET /walker/show)
walker show {
    obj __specs__ {
        static has methods: list = ["get"];
        static has auth: bool = False;
        static has summary: str = "List all users";
    }

    can fetch with `root entry {
        # collect nodes connected to root of archetype User
        all_users = [-->(`?User)];
        users_list = [
            {"name": u.name, "email": u.email}
            for u in all_users
        ];

        report {
            "total": len(users_list),
            "users": users_list
        };
    }
}
