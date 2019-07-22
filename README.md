[![Build Status](https://travis-ci.org/lucianmot/acebook-off-the-rails.svg?branch=master)](https://travis-ci.org/lucianmot/acebook-off-the-rails)

# AceBook

This project is a Ruby on Rails social message posting application. It is one of the Makers Academy engineering projects.

# Live Demo

If you would like to view this project click the following link:<br />
https://acebook-off-the-rails.herokuapp.com/

## Meet the Team

![Team Off-the-Rails](team-otr.jpg)

## Usage

To be described when we have a working version.

## API

To be described when we have a working API, if that happens.

## How to Install

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## How to Test

Navigate to the root of the project then run the tests from the command line

```console
admin$ rspec
```

## How to analyse the complexity of the commits
Navigate to the root of the project then run the tests from the command line. To be run when the level of codebase complexity has to be known.

```console
admin$ rubycritic app app/controllers/application_controller.rb
```
It takes you to the browser and displays your report:

![Image of the rubycritic report](https://user-images.githubusercontent.com/12727270/61628020-0ec01380-ac79-11e9-8a98-dda7b01adbfc.png)


## Project Kanban Board

https://trello.com/b/voEAOwPH/off-the-rails-taskboard

## Technology Used

* Ruby on Rails - Web Application Framework
* Devise - User Authentication
* RubyCritic - Code Quality Analyser

## License

GNU General Public License v2.0

## Completed User Stories

As a User  
So that I know I need to log in  
I should be re-directed to the index page if I try and go to any other page when not logged in  

As a User  
So that I can sign up sucessfully  
I get feedback when I enter invalid sign-up details

As a User  
So that I know if log-in was sucessfull  
I get confirmation on login  

As a User  
So that I can see everything I've posted  
I am re-directed to my list of posts after I log in  
