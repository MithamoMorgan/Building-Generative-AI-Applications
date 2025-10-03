def hello_world() -> str{
    return "Hello world!";
}

# with entry {
#     message = hello_world();
#     print(message);
# }

with entry {
    print(f"hello_world");
}