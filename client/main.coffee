###
# This file will be loaded last since it's named main.*
###


# Code to run on server at startup
Meteor.startup ->
  Helpers.setLanguage "en"
  Session.set "language", "Helpers.language"
  console.dir "Meteor running at: " + Meteor.absoluteUrl() 
  return


UI.body.rendered = ->
    # Set up reactivity for language dropdown from template "nav.jade"
    $("#en").click ->
      Helpers.setLanguage "en"
      return
    
    $("#sw").click ->
      Helpers.setLanguage "sw"
      return
    return

