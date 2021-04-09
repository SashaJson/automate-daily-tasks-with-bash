echo "# GitInit" >> README.md
git init
git add .
git commit -m $1
git remote add origin $2
git branch -M main
git push -u origin main
