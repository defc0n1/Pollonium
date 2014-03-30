/*
Any sensitive code that you don't want served to the client, such as code containing passwords or authentication mechanisms, should be kept in the server directory.

*/


/*

Meteor.publish('directory', function () {
    return Meteor.users.find({}, {fields: {emails: 1, profile: 1}});
});

Meteor.publish("parties", function() {
    return Parties.find(
	{$or: [{"public": true}, {invited: this.userId}, {owner: this.userId}]});
});
*/
