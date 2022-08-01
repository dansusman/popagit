#!/bin/bash
echo Making this directory a git repository.
git init

echo What should I name your GitHub repository?
read NAME
read -p "Do you wish to have your code private? (y/n)" yn
public=true

if [[ "$yn" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    public=false
fi


if [ "$public" = true ]; then
    echo Creating a public repository for you!
    gh repo create $NAME --public --source=. --remote=upstrem
else
    echo Creating a private repository for you!
    gh repo create $NAME --private --source=. --remote=upstream
fi

USERNAME=$(git config user.name)

git remote add origin https://github.com/$USERNAME/$NAME.git

# git push --set-upstream origin main


