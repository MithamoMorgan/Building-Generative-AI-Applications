# Jac Cloud

Jac Cloud is a powerful cloud-native framework that transforms your Jac applications into production-ready API servers with minimal configuration. Simply replace `jac run` with `jac serve` to transform your application into a fully-featured web service.

I have created a simple Jac server program that manages users by accepting their name, email, and password in JSON format. The program defines two walkers exposed as REST API endpoints: `add_user`, which adds a new user and returns their name and email (passwords are hidden for security), and `show`, which lists all users added so far with their names and emails. The User node serves as a blueprint, and actual user nodes are created when the add_user walker is called. Future improvements will include password hashing to securely store and display encoded passwords.
