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

# Create the repository on GitHub (public; use --private for private repos)
gh repo create "$repoName" --public --source=. --remote=origin --push

git branch -M main
git remote add origin $GIT_URL
git push -u origin main