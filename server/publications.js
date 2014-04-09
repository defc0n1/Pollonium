Meteor.publish("surveylist", function() {
  return SurveyList.find();
});

Meteor.publish("survey", function(list_id) {
  return Survey.find({
    list_id: list_id // list_id svarar mot den surveylist som items egentligen tillhör (byt mot schema)
  });
});
