
# A global reference, because coffeescript wraps everything in a closure
root = global ? window



    # code to run on server at startup
Meteor.startup ->
  Helpers.setLanguage "en"
  Session.set "language", "Helpers.language"
  return

Template.nav.rendered = ->
    $("#en").click ->
      Helpers.setLanguage "en"
      return
    
    $("#sw").click ->
      Helpers.setLanguage "sw"
      return
    return


###    
Template.manage.events = "click en": ->
    alert "You pressed the button"
###
###
@$("#en").click ->
  console.log "clicked"
  return
###
###
    $("#sw").click (e) ->
      e.preventDefault()
      #do something
      console.dir "clicked swedish"
      return
###

###
#root = global ? window

if root.Meteor.isClient
  root.Template.hello.greeting = ->
    "Welcome to FirstApp."

  root.Template.hello.events = "click input": ->
    alert "You pressed the button"
###