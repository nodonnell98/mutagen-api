# README

## Setup

This project has been dockerised.

To build and run the application run the following commands

``` docker-compose build```

next, if you wish to populate the database, seed data has been created and can be added with the command

```dcr --rm web bin/rails db:setup```

This will create two users
```
email: admin@example.com
password: SuperSecret123!

email: user@example.com
pasword: SuperSecret123!
```

The next step is to start the containers. The first is the database container and be initialised with:

```docker-compose up -d db```
Note: The -d tag lets the container run detatched in the background

Finally, run the command to serve the API on localhost:3000

``` docker-compose up web```
