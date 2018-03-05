# Guild Chat

This is a simple chat application written using Ruby on Rails

## Requirements

* Ruby

## Installation

To run the application, simply clone the repo and install the required gems:

> $ bundle install

## Running the server

You can start the application, but running the rails server and browsing to http://localhost:3000

> $ rails s

## Usage

When you browse to the application, you will see a prompt asking you to select a user.
When you click on a user, you'll be taken to the chat application.

## Design Decisions

For this application, I used Ruby on Rails to build the chat app. I made use of ActionCable, Rails's web socket library. This made implementing the realtime chat pretty trivial.

For storage, I used sqlite. The exercise seemed simple enough that sqlite would be a good enough.

Rails generates Coffeescript for the javascript files. I decided to use regular javascript instead. I have more familiarity with vanilla JS and I thought it would help me move faster than trying to write Coffeescript.

## Known Issues

The users are hardcoded and passed as parameters to the messages index action. This means that you can replace the parameter with anything and add a new user. In a more robust system, you'd want to back this by a User model and do some authentication.

Because this is using web sockets, there is currently a bug on the `Messages#create` action. Originally I was going to use this action to just return a json response and append the message response to the list. When I decided to use an ActionCable channel, I realized this action was unnecessary.

## Possible Improvements

Right now, I'm using server side rendering to render the template and pass it back to the client. A more robust solution might pass JSON back and have client side rendering to actually add the message to the list.

There are currently not tests around the ActionCable channel. I'd probably move that logic into a service/command layer and add more tests around it. Given the limited time, I decided to use this time elsewhere instead of creating a service layer.

