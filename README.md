# README

Ruby version : 3.1.0

Step:

1. git clone
2. bundle install
3. set .env
4. create database based on you .env config
5. bin/rails db:migrate
6. bin/rails db:seed
7. bin/rails server
8. go to localhost:3000


###### For creating new account : 

bin/rails c
    
    `require_relative "script/create_user"`
    
    `RegisterUser.new("useruser","password").register`
    

###### List users :

`username: user1@wallet.com`

`password: password`

==============================

`username: user2@wallet.com`

`password: password`

==============================

`username: user3@wallet.com`

`password: password`

###### Postman Collection :

import from  postman/wallet.postman_collection.json