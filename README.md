g# README
Software requirements: 
- Ruby 2.3.3
- Rails 5.0.1
- Postgres & pgAdmin 4

#Existing project:
- git remote add origin https://yeupho@bitbucket.org/yeupho/golems.git
- git push -u origin master

#Git new project: 
- git clone https://yeupho@bitbucket.org/yeupho/golems.git
- git commit -m "Your commit version, or comments"
- git push -u origin master


# Steps after cloning
- First establish connection to postgres in the database tab in intellij, download drivers#
- bundle install
- rails db:create
- After you db:create, replace the database name in the postgres connection to:
GOLEMS_development
- rails db:migrate


