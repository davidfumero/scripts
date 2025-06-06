#! /bin/sh
repoName=$1

while [ -z "$repoName" ]
do
    echo 'Provide a repository name'
    read -r -p $'Repository name: ' repoName
done

echo "# $repoName" >> README.md
git init
git add .
git commit -m "first commit"

# Try to create the GitHub repo and push code
if gh repo create "$repoName" --public --source=. --remote=origin --push; then
    echo "Repository '$repoName' created and code pushed!"
else
    echo "Repository '$repoName' already exists or creation failed."
    echo "Setting remote and pushing manually..."
    git remote add origin "git@github.com:YOUR_GITHUB_USERNAME/$repoName.git" 2>/dev/null
    git branch -M main
    git push -u origin main
fi