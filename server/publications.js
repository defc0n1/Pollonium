/**
* Created with Pollonium.
* User: perjo927
* Date: 2014-04-08
* Time: 09:10 PM
* To change this template use Tools | Templates.
*/
//SurveyList = new Meteor.Collection("surveylist")
//Survey = new Meteor.Collection("survey")

Meteor.publish("surveylist", function() {
  return SurveyList.find();
});

Meteor.publish("survey", function(list_id) {
  return Survey.find({
    list_id: list_id
  });
});
