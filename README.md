# README

#For your API,

#1.Describe the API and how it relates to the overall full stack project. Include the purpose, target audience and scope.

#2.Describe the API's architecture, including the main aspects of your application and how it interactions with your front end as well including authentication and authorization.

#3.Describe the setup instructions to start the project.

a. Ubuntu terminal
b. ran rails new wheelchair_exchange_3_api --api -T
c. opened in VSCode
d. uncommented or added to Gemfile
e. opened VSCode terminal
f. ran bundle i
e. ran rails g rspec:install

#4.Refer to the set of gems utilized in the project other than the default added gems.

a. uncommented bcrypt and rack-cors
b. added jwt and kaminari
c. added rails-rspec, factory_bot_rails, and faker to test development
d. move sqlite3 to production

#5.Describe testing made in your API.

a. spec file created from running rails g rspec:install
b. factories created from gem factory_bot_rails 
c. factories, models, and requests created for models
d. rails-helper and spec-helper
e. created spec/requests/sessions_spec for JWT auth
 
#6.Please include the url to your Front end Project's repository

https://github.com/Deborah-McVey/wheelchair_exchange_3_client


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
