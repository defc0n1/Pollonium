
# A global reference, because coffeescript wraps everything in a closure
root = global ? window


Meteor.startup ->
    # code to run on server at startup
    Helpers.setLanguage "en"
    Session.set 'language', "Helpers.language" #"en"

    
###
#root = global ? window

if root.Meteor.isClient
  root.Template.hello.greeting = ->
    "Welcome to FirstApp."

  root.Template.hello.events = "click input": ->
    alert "You pressed the button"
###