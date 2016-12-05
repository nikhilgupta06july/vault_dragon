# README

This project just shows the demo of an assignment given by VaultDragon and this following involves all the code for managing version control

https://github.com/nikhilgupta06july/vault_dragon/blob/master/app/controllers/api/vault_dragons_controller.rb
 

Things you may want to cover:

* DEMO API to to add key and its value
  http://52.89.246.243/api/vault_dragons 
   ** POST  content-type: application/json 
      {"any_key": "any_value"}

* To get Latest Value of key
   http://52.89.246.243/api/vault_dragons/ANY_KEY_NAME
    ** GET  content-type: application/x-www-form-urlencoded

* To get Value of key at specific time 
  http://52.89.246.243/api/vault_dragons/ANY_KEY_NAME?timestamp=UTC_TIMESTAMP
    ** GET  content-type: application/x-www-form-urlencoded
    
Some Project specific points to note:-


* Done using Latest Rails 5.0 and Ruby 2.3.1

* Mysql Database Used

* Validation of JSON and it's format needed for API has been writted

* Deployed Using AWS EC2 and RDS

* Token Authentication done in controller but skipped to ignore extra step 

* Every Request returns a JSON response until 404 

* only one table used with two columns - key, value (id,created_by and updated_by are added by rails itself automatically)

*
