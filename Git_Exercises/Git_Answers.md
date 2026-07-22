# Git Hands-on Exercises

## Exercise 1
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git init
echo "welcome to git" > welcome.txt
git status
git add welcome.txt
git commit -m "Added welcome.txt"
```

## Exercise 2
```bash
mkdir log
echo "error" > log/error.log
echo "*.log" > .gitignore
echo "log/" >> .gitignore
git add .gitignore
git commit -m "Add gitignore"
```

## Exercise 3
```bash
git branch GitNewBranch
git branch -a
git checkout GitNewBranch
echo "branch content" > branchfile.txt
git add branchfile.txt
git commit -m "Branch commit"
git checkout master
git merge GitNewBranch
git branch -d GitNewBranch
```

## Exercise 4
```bash
git checkout -b GitWork
echo "<hello></hello>" > hello.xml
git add hello.xml
git commit -m "hello xml branch"
git checkout master
echo "<hello>master</hello>" > hello.xml
git add hello.xml
git commit -m "hello xml master"
# This merge will cause a conflict
git merge GitWork
# Open P4Merge or resolve manually
git add hello.xml
git commit -m "Resolved conflict"
```

## Exercise 5
```bash
git pull origin master
git push origin master
```
