
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

##
activateInput = (input) ->
  input.focus()
  input.select()


####################################################
# Sortable
#Code by Avital Oliver
#https://github.com/avital
#https://github.com/meteor/meteor/tree/master/examples/unfinished/reorderable-list
#
SimpleRationalRanks =
  beforeFirst: (firstRank) ->
    firstRank - 1
  between: (beforeRank, afterRank) ->
    (beforeRank + afterRank) / 2
  afterLast: (lastRank) ->
    lastRank + 1
    
    
Template.create_survey.rendered = ->
    # uses the 'sortable' interaction from jquery ui
    # Code by Avital Oliver
    $(@find("#item-list")).sortable stop: (event, ui) -> # fired when an item is dropped
        el = ui.item.get(0)
        before = ui.item.prev().get(0)
        after = ui.item.next().get(0)
        newRank = undefined      
        
        unless before # moving to the top of the list
          newRank = SimpleRationalRanks.beforeFirst(UI.getElementData(after).rank)
        else unless after # moving to the bottom of the list
          newRank = SimpleRationalRanks.afterLast(UI.getElementData(before).rank)
        else
          newRank = SimpleRationalRanks.between(UI.getElementData(before).rank, UI.getElementData(after).rank)

        Survey.update UI.getElementData(el)._id,
          $set:
            rank: newRank
        return

################ Helpers for creating survey items ######
Template.insertQuestionForm.editingDoc = ->
  #console.log Session.get("selectedDocId")
  return Question.findOne _id: Session.get("selectedDocId")
  #Question.remove Session.get("selectedDocId")
  #return

Template.create_survey.events okCancelEvents("#new-survey",
  ok: (text, evt) ->
    rank = Survey.find().count() + 1 # TODO: Sortera rätt
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