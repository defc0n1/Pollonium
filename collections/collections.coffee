###
# Meteor Collection that stores surveys
# 
# Code inside folders that are not client/ or server/ will run 
# in bothecontexts
###

# SurveyList:
# year: String
# _id: _id
# Title: String
#
@SurveyList = new Meteor.Collection("surveylist")

# SurveyItem:
# year: Number -> list_id: _id
# type: -> String (dynamic reference to alpaca form schema)
# rank: Number
@SurveyItems = new Meteor.Collection("surveyitems")



SurveyList.allow # TODO:  Allow  onlyfor auth
  insert: ->
    true
  update: ->
    true
  remove: ->
    true


SurveyItems.allow # TODO: Allow for auth
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

    
#########################

@Question = new Meteor.Collection("question",
  schema:
    radioBoolean: {
      type: Boolean,
      #optional: true,
      defaultValue: true
    }
)

Question.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true
  fetch: []
###