###
# Meteor Collection that stores surveys
# 
# Code inside folders that are not client/ or server/ will run 
# in bothecontexts
###


@SurveyList = new Meteor.Collection("surveylist")
@Survey = new Meteor.Collection("survey")



SurveyList.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true


Survey.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true



@Question = new Meteor.Collection("question",
  schema:
    title:
      type: String
      label: "Title"
      max: 25

    optionalBoolean: {
      type: Boolean,
      optional: true
    },
    radioBoolean: {
      type: Boolean,
      optional: true,
      defaultValue: true
    },
    selectBoolean: {
      type: Boolean,
      optional: true,
      defaultValue: false
    },
    
    free:
      type: String
      label: "Free text"
      optional: true
      max: 100
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