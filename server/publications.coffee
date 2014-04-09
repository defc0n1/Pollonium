###
server/publications.coffee     # <- Meteor.publish definitions
###

Meteor.publish "surveylist", ->
  SurveyList.find()

Meteor.publish "survey", (list_id) ->
  # list_id svarar mot den surveylist som items egentligen tillhör (byt mot schema)
  Survey.find list_id: list_id 