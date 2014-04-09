###
server/publications.coffee     # <- Meteor.publish definitions
###
#@SurveyList = new Meteor.Collection("surveylist")
#@Survey = new Meteor.Collection("survey")

# Lists -- {name: String}
#Lists = new Meteor.Collection("lists")

# Publish complete set of lists to all clients.
###
Meteor.publish "surveylist", ->
  SurveyList.find()
    
# Survey -- {text: String,
#           list_id: Number, #String,
#           rank: Number}

# Publish all items for requested list_id.
Meteor.publish "survey", (list_id) ->
  #check list_id, String
  Survey.find list_id: list_id
###