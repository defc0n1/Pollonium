###
server/publications.coffee     # <- Meteor.publish definitions

###

Meteor.publish "surveys", ->
    Surveys.find()