####
#
#


class Survey
    @count: 0
    _id: 0
    @_MAX_Q_PER_PAGE: 10   
    @_surveyQuestions: {}
    
    constructor: (@year) -> 
        Survey._count++;
        @_id = count
    
    # Class methods, static
    @addQuestion: () ->
    @removeQuestion: () ->    
    

class SurveyQuestion
    # Class members
    @count: 0 # class variable, not instance variable
    
    # Private
    _id: 0
    _inputFields: {}
    _buttons: {}
    
    # Public
    label: "Default label"
    toolTip: "Default tooltip"
    
    constructor: (options) ->   
        {@label, @inputFields, @buttons} = options
        SurveyQuestion._count++
        @_id = count
        # item = new Survey label: "How old are you?"
    
    # class methods
    @getCount: ->
        @_id
        #Survey.get_count => number of total survey items (class method)

    # Instance methods
    getId: => # fat arrow = instance method
        _id
    reOrder: (newId) =>
        _id = newId
    addItem: (item) =>
    removeItem: (item) =>

        
class Button
  constructor: (@something) ->
   
class RadioButton extends Button
  constructor: ->
    super("Parrot")
