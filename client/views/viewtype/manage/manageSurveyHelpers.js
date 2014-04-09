/**
* Created with Pollonium.
* User: perjo927
* Date: 2014-04-08
* Time: 09:15 PM
* To change this template use Tools | Templates.
*/
var activateInput, itemCount, okCancelEvents;

Template.create_survey.rendered = function() {
  return $(".page-header").remove();
};

Session.setDefault("list_id", 2014);
Session.setDefault("editing_itemname", null);

itemCount = 0//Survey.find().count();

okCancelEvents = function(selector, callbacks) {
  var cancel, events, ok;
  ok = callbacks.ok || function() {};
  cancel = callbacks.cancel || function() {};
  events = {};
  events["keyup " + selector + ", keydown " + selector + ", focusout " + selector] = function(evt) {
    var value;
    if (evt.type === "keydown" && evt.which === 27) {
      return cancel.call(this, evt);
    } else if (evt.type === "keyup" && evt.which === 13 || evt.type === "focusout") {
      value = String(evt.target.value || "");
      if (value) {
        return ok.call(this, value, evt);
      } else {
        return cancel.call(this, evt);
      }
    }
  };
  return events;
};

activateInput = function(input) {
  input.focus();
  return input.select();
};

Template.survey_create.events(okCancelEvents("#new-survey", {
  ok: function(text, evt) {
    Survey.insert({
      text: text,
      list_id: Session.get("list_id"),
      rank: itemCount++
    });
    return evt.target.value = "";
  }
}));

Template.survey_create.survey = function() {
  var list_id, sel;
  list_id = Session.get("list_id");
  sel = {
    list_id: list_id
  };
  return Survey.find(sel, {
    sort: {
      rank: 1
    }
  });
};

Template.survey_create.isItems = function() {
  var list_id;
  list_id = Session.get("list_id");
  return list_id;
};

Template.survey_item.editing = function() {
  return Session.equals("editing_itemname", this._id);
};

Template.survey_item.events({
  "click .destroy": function() {
    Survey.remove(this._id);
    return itemCount--;
  },
  "dblclick .display .survey-text": function(evt, tmpl) {
    Session.set("editing_itemname", this._id);
    Deps.flush();
    return activateInput(tmpl.find("#survey-input"));
  },
  "click .remove": function(evt) {
    var id;
    id = this.list_id;
    evt.target.parentNode.style.opacity = 0;
    return Meteor.setTimeout((function() {
      return Survey.update({
        _id: id
      });
    }), 300);
  }
});

Template.survey_item.events(okCancelEvents("#survey-input", {
  ok: function(value) {
    Survey.update(this._id, {
      $set: {
        text: value
      }
    });
    return Session.set("editing_itemname", null);
  },
  cancel: function() {
    return Session.set("editing_itemname", null);
  }
}));
