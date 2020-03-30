# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

2.70

* Database creation

You can run the following command to create the database
```
docker run --name experts_directory_db -e POSTGRES_USER=experts_directory -e POSTGRES_DB=experts_directory -e POSTGRES_PASSWORD='experts_directory!23' -d -p 5453:5432 postgres
```

* Database initialization

Before start the application you should run the migrations:
```
rake db:migrate
```

* Deployment instructions

Now you can start the server with the command:
```
rails s
```
## How to test the requiriments:

### A member can be created using their name and a personal website address.

Go to url:

```http://0.0.0.0:3000/members/new```

### When a member is created, all the heading (h1-h3) values are pulled in from the website to that members profile.

### The website url is shortened (e.g. using http://goo.gl).

### Viewing an actual member should display the name, website URL, shortening, website headings, and links to their friends' pages.

Go to url:

```http://0.0.0.0:3000/members/#{member_id}```

### After the member has been added, I can define their friendships with other existing members. Friendships are bi-directional i.e. If David is a friend of Oliver, Oliver is always a friend of David as well.

To define friendship go to:

```http://0.0.0.0:3000/friendships/new```

### The interface should list all members with their name, short url and the number of friends.

To list all memmber go to:

```http://0.0.0.0:3000/members```

### Now, looking at Alan's profile, I want to find experts in the application who write about a certain topic and are not already friends of Alan.

### Results should show the path of introduction from Alan to the expert e.g. Alan wants to get introduced to someone who writes about 'Dog breeding'. Claudia's website has a heading tag "Dog breeding in Ukraine". Bart knows Alan and Claudia. An example search result would be Alan -> Bart -> Claudia ("Dog breeding in Ukraine").

to search for experts go to:

```http://0.0.0.0:3000/find_experts```

Select a member and write the topic you want to search


