#
Session.setDefault "list_id", null # null// Id(year) of currently selected list, TODO: fetch actual year
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
   
    


#####    
Template.create_survey.rendered = ->
    # Clear for extra space
    $(".page-header").remove()
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

        SurveyItems.update UI.getElementData(el)._id,
          $set:
            rank: newRank
        return
    return




################ Helpers for creating survey items ######
########## Helpers ofr survey items #############

Template.create_survey.events okCancelEvents("#new-survey",
  ok: (text, evt) ->
    rank = SurveyItems.find().count() #0 # TODO: ranka efter listan är sorterad
    
    SurveyItems.insert # TODO: Generate chosen Alpaca form and insert text as label
      text: text
      list_id: Session.get("list_id")
      rank: rank

    evt.target.value = ""
)



Template.create_survey.newSurveyRequired = ->
   SurveyList.find().count() is 0
    
    
    
    

Template.new_survey.events
    "click #new_survey": ->
        SurveyList.insert
          label: companyName + " web poll"
          year: new Date().getFullYear() # TODO: customize this
          lock: false
        return



Template.survey_item.editing = ->
  Session.equals "editing_itemname", @_id

Template.survey_item.events
  "click .destroy": ->
    SurveyItems.remove @_id
    # TODO: Remove alpaca
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
      SurveyItems.update _id: id
    ), 300

Template.survey_item.events okCancelEvents("#survey-input",
  ok: (value) ->
    SurveyItems.update @_id,
      $set:
        text: value
    Session.set "editing_itemname", null
  cancel: ->
    Session.set "editing_itemname", null
)

#### Survey editing ####
Template.edit_survey.newSurveyRequired = ->
   SurveyList.find().count() is 0

Template.edit_survey.events
    "click #btn_survey_edit": (evt) ->
        #evt.preventDefault()
        list_id = @_id
        console.dir @_id
        locked = SurveyList.find
            _id: list_id
        if locked
            console.dir "Locked!"
            alert "Locked!"
        return
    "click #btn_survey_lock_unlock": (evt) ->
        lockedState = SurveyList.find
            _id: @_id
        SurveyList.update @_id,
          $set:
            lock: not lockedState
        alert "lockedState: " + (not lockedState) 
        return
           
        


Template.insertQuestionForm.editingDoc = ->
  #console.log Session.get("selectedDocId")
  #return Question.findOne _id: Session.get("selectedDocId")
  #Question.remove Session.get("selectedDocId")
  return