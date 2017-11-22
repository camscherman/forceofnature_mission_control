# README

A ruby on rails platform for volunteers to organize, plan, and edit events. Full local calendar integrated with Google Calendar API. User authentication and restrictions.

To get started on your local computer, clone this repository.

run the following commands:

$bundle

$rails db:create

$rails db:migrate

The app has some optional integration with Google calendar API. 

Edit the add/assets/javascript/application.js by inserting your Google calendar API key by repacing YOUR_API_KEY
and YOUR_CALENDAR_ID.

Also, to integrate the mailer, you need to set up your config/initializers/app_keys.rb (follow app_keys.rb.example to see an example)


