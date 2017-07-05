#! /bin/sh

#Change to home folder for easy directory traversal:
cd ~
#Get the user input for the project name:
echo "Name the project:"
read projectName
#move to the web_projects directory and make the projectname directory -p (i.e. if not exists):
cd Documents/web_projects
mkdir -p $projectName
#Insert boilerplate:
#First, copy the readme file to the root folder for auto github display:
cp boilerplate/readme/README.md $projectName
#Then make a readmeAssets directory and copy the rest of the readme stuff into it
mkdir readmeAssets
cp -r boilerplate/readme/images $projectName/readmeAssets
cp boilerplate/readme/header.png $projectName/readmeAssets
#Then, add the other files and folders
cp -r boilerplate/css $projectName
cp -r boilerplate/js $projectName
cp -r boilerplate/images $projectName
cp boilerplate/index.html $projectName
#then change to the new directory and set up git, adding all files and folders:
cd $projectName
git init
git add readmeAssets
git add images
git add js
git add css
git add index.html
git add README.md
git commit -m "first commit: project setup with boilerplate"
git remote add origin https://github.com/davebza/$projectName.git
git push -u origin master
git status
#then open the files in atom:
atom index.html
atom css/style.css
atom js/scripts.js
atom README.md
#and finally open the index folder in default browser:
open index.html
