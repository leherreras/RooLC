# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.0.2

* System dependencies

* Configuration

* Database creation:

`docker run --name roolc-db -e POSTGRES_PASSWORD=roolc -e POSTGRES_USER=RooLC -p 5432:5432 -d postgres`

* Database initialization

* How to run the test suite

`rubocop`

`bundle exec rspec`

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

`rails s`

* ...