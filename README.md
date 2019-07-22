# AceBook

This project is a Ruby on Rails social message posting application. It is one of the Makers Academy engineering projects.

## Meet the Team

![Team Off-the-Rails](team-otr.jpg)

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
Navigate to the root of the project then run the tests from the command line

```console
admin$ rubycritic app app/controllers/application_controller.rb
```

## Project Kanban Board

https://trello.com/b/voEAOwPH/off-the-rails-taskboard

## Technology Used

* Ruby on Rails - Web Application Framework
* Devise - User Authentication
* RubyCritic - Code Quality Analyser
