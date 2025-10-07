# About

In this folder, I store examples and explanations to understand `Object Spatial Programming` by understanding the workflow using simple but powerful examples.

### Example 1- Bidirectional Polymorphism:

```bash
node Host{
    has name: str;
    can welcome with Visitor entry{
        print(f"{self.name} says feeel at home!");
    }
}

walker Visitor{

    can start with `root entry{
        visit[-->];
    }

    can visit with Host entry{
        print(f"Hello {here.name}, can I come in?");
        visit [-->];
    }
}

with entry{
    alice = Host(name = "Alice");
    root ++> alice;
    root spawn Visitor();
}
```

### Note

1. `root spawn Visitor()`: Tells the walker to start at root.
2. `can start with 'root entry{}`: You have to define what happens when walker starts at root since we spawned at root; move from `root` to `alice`.
