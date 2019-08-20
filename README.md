# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

 ## Ruby version
 ```versions
 ruby version 2.2.6
 rails version 5.0
  ```

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



installation process on windows  why because i am using windows pc


1. go to  visit link [railsinstaller](http://railsinstaller.org/en) 

2. select rails installer latest version. I select ruby 2.2 version. in that rails installer providing 
rails version 5.0 

3. select one version of rails installer .exe file download automatically

4. once downloading is completed double click on .exe file and click next next. 

5. finally click on finish button.

6. after that check on command prompt 

7. ruby -v enter this command on cmd it showing ruby version.

8. same as rails also rails -v it showing rails version.

9. finally rails installation process completed.

10. if u want to create new project by using this command rails new blog -d postgresql

11. the above command is create new project with postgressql database configuration in database.yml
need to add username and password and databasename. 

12.postgres database server need install and set password.

13. after that add pg gem in gemfile.rb 

14. after creating project going to that location need to do bundle install command

  


 













