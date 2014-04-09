###
# Meteor Collection that stores surveys
# 
# Code inside folders that are not client/ or server/ will run 
# in bothe contexts
###

#@Surveys = new Meteor.Collection 'surveys'

###

@SurveyList = new Meteor.Collection("surveylist")
@Survey = new Meteor.Collection("survey")

if SurveyList.find().count() is 0
  SurveyList.insert
    label: "webpoll"
    year: 2014

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
###
###

@Books = new Meteor.Collection("books",
  schema:
    title:
      type: String
      label: "Title"
      max: 50

    author:
      type: String
      label: "Author"
      optional: true

    copies:
      type: Number
      label: "Number of copies"
      min: 0
      optional: true
    
    lastCheckedOut:
      type: Date
      label: "Last date this book was checked out"
      optional: true
    
    summary:
      type: String
      label: "Brief summary"
      optional: true
      max: 100
)

Books.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true
  fetch: []
###