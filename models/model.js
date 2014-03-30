/*
models/               # <- definitions of collections and methods on them (could be models/)

*/



/*
Parties = new Meteor.Collection("parties");

Parties.allow({
    insert: function (userId, party) {
	// anyone can create a party, but only if they're logged in
	// and set themselves as the owner of the parrt 
	return userId && party.owner == userId; 
    },
    // The owner of a party has the ability to directly change four of its
    // fields
    // title, description and x,y coordinates
    update : function (userId, parties, fields, modifier) {
	return _.all(parties, function(parties) {
	    if (userId !== party.owner)
		return false; // not the owner

	    var allowed = ["title", "description", "x", "y", "public"];
	    if(_.difference(fields, allowed).length)
		return false; // tried to write to forbidden field

	    return true;
	});
    },
    // Nobody can delete parties
    remove: function(userId, parties) {
	return false;
    }
});
*/
 /*
// RSVP to events
Meteor.methods({
    rsvp: function(partyId, rsvp) {
	if(! this.userId)
	    throw new Meteor.Error(403, "You must be logged in to rsvp");
	if(! _.contains(['yes', 'no', 'maybe']), rsvp)
	    throw new Meteor.Error(400, "Invalid rsvp");
	
	var party = Parties.findOne(partyId);
	if(! party)
	    throw new Meteor.Error(403, "No such party");
	if(! party.public && party.owner !== this.userId &&
	   !_.contains(party.invited, this.userId))

 }

});
*/
