# Micolet test

This the resolution of '', more description:

* Files structure for functionallity

- Controllers and services:
  app/controllers/application_controller.rb
  app/controllers/suscriptions_controller.rb
  app/services/email_validator.rb

- Models:
  app/models/suscription.rb

- Mailers:
  app/mailers/confirm_suscription_mailer.rb

- Views:
  app/views/layouts/landing.html.erb
  app/views/suscriptions/new.html.erb
  app/views/suscriptions/_form.html.erb
  app/views/confirm_suscription_mailer/confirm.html.erb

- JavaScript & CSS:
  app/javascript/packs/landing.js
  app/assets/stylesheets/suscriptions.scss

- I18n:
  es: 
    config/locales/es/models/suscription.yml
    config/locales/es/mailers/confirm_suscription.yml
    config/locales/es/views/suscriptions.yml
  en: 
    config/locales/en/models/suscription.yml
    config/locales/en/mailers/confirm_suscription.yml
    config/locales/en/views/suscriptions.yml

* Ruby version
- ruby '3.0.0'
- rails '6.1.4'

* System dependencies
- Ruby and rails, frontend is managed by materialize css, but is called remotely (CDN), this is for demostration purposes.

* Configuration
- Download project and run:
  bundle install
  rails s

* Database creation
- This project uses SQLite default by rails

* Database initialization
- Run rails db:migrate

* How to run the test suite
  Run (for development purpose): 
  rspec spec/models/suscription_spec.rb
  rspec spec/system/suscription_spec.rb

* Services
- This project has one service for abstract api requests: app/services/email_validator.rb
