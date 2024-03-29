# Snookums - Feline Snooker League™ Score Tracking Application

<p align="center">
<img src="https://github.com/kolide/snookums-goronfreeman/raw/main/app/assets/images/snooker.jpg" />

We, the newly formed American branch of the Feline Snooker League™, needed a score tracking application for their seasonal rankings.  We engaged the widely regarded *RailsPoodles* consulting shop to complete the task, but subsequently several deliverable issues, ranging from missed deadlines to the principal consultant's insistence on urinating on every desk in our office, have forced us to seek aid elsewhere.  This is where you come in.  Our remaining time to finish this is very limited, *so keep all work on these challenges limited to three hours total.*

# The Project

We have a partially completed, somewhat busted Rails application that you can make use of.  It's not much to work with, but we want to salvage what we can and move forward with the following work/challenges (remember: *you're limited to three hours to complete this!*):

## Challenge #1: Clean up and complete

You really need to complete everything in this section.  We're looking for basic competency with Rails, knowledge of Rails conventions/practices, and overall ability to work with the Rails stack.

* Apparently the contractor let his teenage intern do some work on the app, and as a result, the code in the players index view is a total mess.  Clean it up and simplify it!
* Despite several demos showing basic functionality like viewing players and what not, there is currently no way to create or update a player at all in the UI.  Add that code!  One should be able to add, update, and delete players at will.
* There are several things throughout the app (from the routes to the controller code) that aren't very "Rails-y."  Find as many instances as you can and bring them back in line with typical Rails practice.
* There are no tests for anything!  What!?  Go back and add some cursory tests for players controllers/endpoints, along with tests for anything you'll add to `Player` (don't worry about view tests unless you're a glutton for pain and _want_ to add some...).
This project uses rspec, but if you are more familiar with minitest, feel free to use that instead.

## Challenge #2: Improve and expand

In this section, we're looking for your ability to model data on your own, write code to work with it, and test said code well.

* The board at the top of every page (i.e., Top Cat, Season Average, Bottom Cat, etc.) is currently un-implemented.  Implement methods to find each value based on the players' current scores and expose it in the right place in the board.  Likewise, there aren't any validations on `Player`, which is problematic for calculating points (i.e., they could put in negative numbers or somehow put in more points than possible in a 10 match season).  Don't forget to test the methods and validations!
* It looks like rank was left un-implemented so players are currently unaware of their seasonal rank. Implement a method to calculate a players rank and update the player's view to show the current rank.
* We need a way to give awards to players for various things.  To start out simple, let's add a new model to the application with an award name (e.g., "Fewest Hairballs in Play") and the ability to associate it with one or more cats.  It'd be best if we could view a list of awards, see which players have earned them, create/edit/delete them, and also see which awards a player has earned on their profile.

## Challenge #3: Bonus rounds

These are bonus rounds that will help us understand the breadth of your skillset.  You don't _have_ to complete any of these (i.e., not doing these will _not_ count against you), but again, it will give us a better understanding of what you're capable of.  Remember, we ask that you time-box this exercise to three hours, so if doing any of these will push you outside of that, *please* don't do them!

* Currently our CSS is decently factored, but it's going to get hairy quick.  Can you refactor it some nice SCSS for us to make it more maintainable?
* We fully believe that Feline Snooker is going to explode in popularity in the U.S., so we'll need to be able to handle a lot of traffic.  Can you implement some caching/indexing throughout the app to make sure that we're able to handle the millions of viewers we know are coming our way?
* Can you easily implement a JSON API for the players?  Don't overthink it, but instead, what's the simplest implementation of a JSON API you could create?

## Final notes

Please try to work in small commits.  Doing so will make reviewing your work much easier for us!

*Again: only spend three hours on this work.*  We don't mean to beat you over the head, but that point is really important!  It's not that we're trying to rush you or put pressure on.  The frank truth is we don't want to make you spend too much time on this project.  We've all been part of take home exercises where you spent 20 hours on a project only to find out you weren't a good fit despite investing half a week's worth of hours into work for them.  To avoid that, we just want to see what you can do in three hours and let you move on!  We're sure you have better things to be doing anyhow. :smile:
