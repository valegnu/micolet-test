# Micolet test

This is the resolution of [Micolet challenge](https://gist.github.com/raulr/db4fad76ff33a91bcbac09162ad7850c), for internationalization are present Spanish and English.<br/>

## System specifications and configurations

* Ruby version<br/>
  ruby '3.0.0'<br/>
  rails '6.1.4'

* System dependencies<br/>
  Ruby and rails, frontend is managed by materialize css, but is called remotely (CDN), this is for demostration purposes.

* Configuration<br/>
  Download project and run:<br/>
  ```
  bundle install
  rails s
  ```

* Database creation<br/>
  This project uses SQLite default by rails<br/>

* Database initialization<br/>
  Run `rails db:migrate`

* How to run the test suite<br/>
  Run (for development purpose):<br/>
  `rspec spec/models/suscription_spec.rb`<br/>
  `rspec spec/system/suscription_spec.rb`

* Services<br/>
  This project has one service for abstract api requests: app/services/email_validator.rb<br/>


## Files structure for functionallity
  These files have logic for this app:<br/>

- **Controllers and services:**<br/>
  app/controllers/application_controller.rb<br/>
  app/controllers/suscriptions_controller.rb<br/>
  app/services/email_validator.rb<br/>

- **Models:**<br/>
  app/models/suscription.rb<br/>

- **Mailers:**<br/>
  app/mailers/confirm_suscription_mailer.rb<br/>

- **Views:**<br/>
  app/views/layouts/landing.html.erb<br/>
  app/views/suscriptions/new.html.erb<br/>
  app/views/suscriptions/_form.html.erb<br/>
  app/views/confirm_suscription_mailer/confirm.html.erb<br/>

- **JavaScript & CSS:**<br/>
  app/javascript/packs/landing.js<br/>
  app/assets/stylesheets/suscriptions.scss<br/>
  
- **Unit test(system and model)**<br/>
  spec/models/suscription_spec.rb<br/>
  spec/system/suscription_spec.rb<br/>
  
- **I18n:**<br/>
  &nbsp;&nbsp;**es:**<br/>
  &nbsp;&nbsp;&nbsp;&nbsp;config/locales/es/models/suscription.yml<br/>
  &nbsp;&nbsp;&nbsp;&nbsp;config/locales/es/mailers/confirm_suscription.yml<br/>
  &nbsp;&nbsp;&nbsp;&nbsp;config/locales/es/views/suscriptions.yml<br/>
  &nbsp;&nbsp;**en:**<br/>
  &nbsp;&nbsp;&nbsp;&nbsp;config/locales/en/models/suscription.yml<br/>
  &nbsp;&nbsp;&nbsp;&nbsp;config/locales/en/mailers/confirm_suscription.yml<br/>
  &nbsp;&nbsp;&nbsp;&nbsp;config/locales/en/views/suscriptions.yml<br/>
  
# Screenshots
![spanish1](https://user-images.githubusercontent.com/94926836/143726658-d8ce0ac7-5c10-4f36-8692-69c8de923b83.png)
![spanish2](https://user-images.githubusercontent.com/94926836/143726663-d8de697e-4ec6-4a5e-aff4-df97a819ee03.png)
![spanish3](https://user-images.githubusercontent.com/94926836/143726666-0fcbd0fe-4b6b-4ded-aaf4-dcfa4813e54d.png)
![english1](https://user-images.githubusercontent.com/94926836/143726669-1e842750-8726-4cbf-a728-6a6cc3114a2e.png)
![english2](https://user-images.githubusercontent.com/94926836/143726674-1ad3c277-3c52-4783-aa0e-67b963845a39.png)
