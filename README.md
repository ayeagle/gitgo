One command git interface for when you just want to commit everything and open the github page.

Lazy engineers only!

1. Clone repo
```shell
git clone git@github.com:ayeagle/gitgo.git && cd gitgo
```

2. Setup to install the script in /usr/local/bin/
```shell
chmod +x gitgo && ./gitgo bin_setup
```

3. See available commands
```shell
gitgo help
```

That's it! Now you can use gitgo with any git project on your machine.

Note that your commit message can be wrapped in quotes or just written like additional arguments, but without quotes you'll be prompted before gitgoing.

Have fun! Saves AT LEAST 5 seconds per commit.
