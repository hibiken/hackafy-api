# Hackafy API

API server for [Hackafy](https://github.com/kenny-hibino/hackafy) (Instagram clone) built with Ruby on Rails

Demo: [Hosted on Heroku](https://radiant-temple-15197.herokuapp.com/)

## Install

Clone this repository and run PostgreSQL, Redis servers.
Using Redis for ActionCable features.

After cloning the repository, run

```
bundle install
rails db:setup
rails server -p 5000
```

Client side applications, both [Web](https://github.com/kenny-hibino/hackafy) and [Native](https://github.com/kenny-hibino/hackafy-native) are configured to use `localhost:5000` as an API endpoint

## Contribution

Feedbacks, and issue reports are more than welcome :)
