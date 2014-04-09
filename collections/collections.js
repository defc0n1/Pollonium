/**
* Created with Pollonium.
* User: perjo927
* Date: 2014-04-08
* Time: 09:08 PM
* To change this template use Tools | Templates.
*/
SurveyList = new Meteor.Collection("surveylist");
Survey = new Meteor.Collection("survey");


SurveyList.allow({
  insert: function() {
    return true;
  },
  update: function() {
    return true;
  },
  remove: function() {
    return true;
  }
});

Survey.allow({
  insert: function() {
    return true;
  },
  update: function() {
    return true;
  },
  remove: function() {
    return true;
  }
});


if (SurveyList.find().count() === 0) {
  SurveyList.insert({
    label: "webpoll",
    year: 2014
  });
}