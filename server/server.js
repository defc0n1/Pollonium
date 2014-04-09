/*
Any sensitive code that you don't want served to the client, such as code containing passwords or authentication mechanisms, should be kept in the server directory.

*/




// if the database is empty on server start, create some sample data.
Meteor.startup(function () {

    if (SurveyList.find().count() === 0) {
      SurveyList.insert({
        label: "webpoll",
        year: 2014
      });
    }
});