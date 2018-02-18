# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

 ruby version 2.2.6
 rails version 5.0
  

* System dependencies

* Configuration

* Database creation
postgres for i am using 'pg' gem 


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


api's

user creating for api

1. post action => localhost:3000/users 
parameters  => name, email, password password_confirmation, user_type

login api

2. localhost:3000/sessions => post
parameters => email, password

creating event by admin

3. localhost:3000/api/admin/events/add  => post
parameters => description, event_type, event_date, duration, host, location

event list

4. localhost:3000/api/admin/events/list => get

user add to event 

5. localhost:3000/api/vi/events/add => post
parameter => event_id

user cancel the event joining

6. http://localhost:3000/api/v1/events/cancelbyuser =>post
parameter => event_id

confirm attendees by admin

7. localhost:3000/api/admin/events/confirmed/confirmAttendees => post
parameters => event_id, user_id

list of confirm attendees by admin

8. localhost:3000/api/admin/events/confirmed/list => get 

remove attendees by admin

9. localhost:3000/api/admin/events/removeAttendees =>post
parameters => user_id, event_id

list of remove attendees by admin

10. localhost:3000/api/admin/events/removed/list => get

list of confirm attendees by admin

11. localhost:3000/api/admin/events/confirmed/list => get

count of attendees willing to join event

12. localhost:3000/api/admin/events/attendeeswillingcount => get

count of not willing to join event

13. localhost:3000/api/admin/events/attendeesnotwillingcount => get

