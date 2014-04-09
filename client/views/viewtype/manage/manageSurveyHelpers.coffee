
# Clear for extra space
Template.create_survey.rendered = ->
  $(".page-header").remove()
  return


#
Session.setDefault "list_id", 2014 # null// Id(year) of currently selected list, TODO: fetch actual year
Session.setDefault "editing_itemname", null # Editing a survey question, set to id of s.question



###### Helpers for in-place editing #########
# https://github.com/perjo927/meteor/blob/devel/examples/todos/client/todos.js, Avital Oliver
# 
# Returns an event map that handles the "escape" and "return" keys and
# "blur" events on a text input (given by selector) and interprets them
# as "ok" or "cancel".
okCancelEvents = (selector, callbacks) ->
  cancel = undefined
  events = undefined
  ok = undefined
  ok = callbacks.ok or ->

  cancel = callbacks.cancel or ->

  events = {}
  events["keyup " + selector + ", keydown " + selector + ", focusout " + selector] = (evt) ->
    value = undefined
    if evt.type is "keydown" and evt.which is 27
      cancel.call this, evt
    else if evt.type is "keyup" and evt.which is 13 or evt.type is "focusout"
      value = String(evt.target.value or "")
      if value
        ok.call this, value, evt
      else
        cancel.call this, evt
  events


activateInput = (input) ->
  input.focus()
  input.select()




################ Helpers for creating survey items ######
Template.create_survey.events okCancelEvents("#new-survey",
  ok: (text, evt) ->
    rank = Survey.find().count() + 1
    Survey.insert
      text: text
      list_id: Session.get("list_id")
      rank: rank

    evt.target.value = ""
)
Template.create_survey.survey = ->
  list_id = undefined
  sel = undefined
  list_id = Session.get("list_id")
  sel = list_id: list_id
  Survey.find sel,
    sort:
      rank: 1


Template.create_survey.isItems = ->
  list_id = undefined
  list_id = Session.get("list_id")
  list_id




########## Helpers ofr survey items #############
Template.survey_item.editing = ->
  Session.equals "editing_itemname", @_id

Template.survey_item.events
  "click .destroy": ->
    Survey.remove @_id
    return

  "dblclick .display .survey-text": (evt, tmpl) ->
    Session.set "editing_itemname", @_id
    Deps.flush()
    activateInput tmpl.find("#survey-input")

  "click .remove": (evt) ->
    id = undefined
    id = @list_id
    evt.target.parentNode.style.opacity = 0
    Meteor.setTimeout (->
      Survey.update _id: id
    ), 300

Template.survey_item.events okCancelEvents("#survey-input",
  ok: (value) ->
    Survey.update @_id,
      $set:
        text: value

    Session.set "editing_itemname", null

  cancel: ->
    Session.set "editing_itemname", null
)