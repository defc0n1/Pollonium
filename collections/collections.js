
SurveyList = new Meteor.Collection("surveylist");
Survey = new Meteor.Collection("survey");


SurveyList.allow({
  insert: function() {
      return true; // TODO:  permission control
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

