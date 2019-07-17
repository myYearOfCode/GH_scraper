# README
This is an app that scrapes [GitHub's weekly trending page.](https://github.com/trending?since=weekly) and returns the data as json. There is a cli version and a RoR version.

### Ruby version

2.4.5

### Installation

Clone the repo.

### System dependencies

run `bundle exec bundle install` in order to install all of the gems

run `yarn install` in order to configure more node/ruby modules.

### Configuration
No configuration is needed. This app can be run in two ways however:
#1 - as a cli with `ruby cli_scraper/github_cli_scraper.rb`
#2 - as an api server with `bundle exec rails s` (running on [localhost](http://localhost:3000))

### Database creation
`rails db:create
`
### Database initialization
`rails db:migrate
`
### How to run the test suite
`bundle exec rake`

### Styleguide
The [airbnb style guide](https://github.com/airbnb/ruby) was referenced while writing this.
