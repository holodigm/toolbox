#!/bin/sh
# This has to be run from development
git checkout development

# Update our list of remotes
git fetch
git remote prune origin

# Remove local fully merged branches
git branch --merged development | grep -v 'development$' | xargs git branch -d

# Show remote fully merged branches
echo "The following remote branches are fully merged and will be removed:"
git branch -r --merged development | sed 's/ *origin\///' | grep -v 'development$'

read -p "Continue (y/n)? "
if [ "$REPLY" == "y" ]
then
  # Remove remote fully merged branches
  git branch -r --merged development | sed 's/ *origin\///' | grep -v 'development$' | xargs -I% git push origin :%
  echo "Done!"
fi
