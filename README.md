One command git interface for when you just want to commit everything.

Lazy engineers only!

1. Clone repo
```shell
git clone git@github.com:ayeagle/gitgo.git && cd gitgo
```

2. Setup to install the script in your env path (only works with zsh atm)
```shell
./gitgo setup
```

3. Refresh path
```shell
source ~./zshrc
```
4. See available commands
```shell
gitgo help
```

That's it! Now you can use gitgo with any git project on your machine.

Note that your commit message can be wrapped in quotes or just written like additional arguments, but without quotes you'll be prompted before gitgoing.

Have fun! Saves at LEAST 5 seconds per commit.