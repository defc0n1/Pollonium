###
server/publications.coffee     # <- Meteor.publish definitions
###

Meteor.publish "surveylist", ->
  SurveyList.find()

Meteor.publish "surveyitems", (list_id) ->
  # list_id svarar mot den surveylist som items egentligen tillhör (byt mot schema)
  check(list_id, String)
  SurveyItems.find list_id: list_id 
    
Meteor.publish "question", ->
  Question.find()