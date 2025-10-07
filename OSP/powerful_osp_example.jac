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
