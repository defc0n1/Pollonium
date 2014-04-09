# Router configuration for app #
#
# CoffeeScript is a dialect of JavaScript. It compiles to JavaScript.
# Uses syntactic sugar on top of JS for readability
# http://coffeescript.org/

# Specific variables for templates used here are imported from 
# lib/templatesConfig.coffee, automatically by Meteor



#  Set main menu items
templatesSetup.manage.menu.menuItems = menuItemsManage

# Set up default actions and templates to be rendered for all @routes
Router.configure 
    layoutTemplate: "layout", #
    notFoundTemplate: 'not-found', # TODO
    loadingTemplate: 'loading'  # TODO
    yieldTemplates: templatesSetup.templates
    onData: ->
        setTitle templatesSetup.manage.navTitle
        return


# Set up routes #
Router.map ->
  @route "survey",
    # *** EXAMPLE ROUTE *** TODO: MAKE POLLONIUM MANAGER ACCOUNT HERE? OR SURVEY
    path: "/" # match the root path
    template: "survey" # will map the domain url (the / path) + automatically render template 
    # layoutTemplate: 'layout', # redundant here
    # yieldTemplates: templatesSetup.templates  # redundant
    onBeforeAction: ->
        setMenu subMenuItemsManage # TODO: another menu
        return
    data: ->    
      templatesSetup.manage # TODO: survey

  ############ MANAGE SURVEYS ##########################
  @route "manage",
    # path: '/manage', // redundant
    template: "manage"
    onBeforeAction: ->
        setMenu subMenuItemsManage
        return
    #data: ->    
      # @params is available inside the data function  
    data: ->    
      templatesSetup.manage       

  @route "manageAccounts",
    path: "/manage/accounts"
    template: "manage_accounts"
    onBeforeAction: ->
        setMenu subMenuItemsManage # TODO: subMenuItemsAccounts
        return
    data: ->    
      templatesSetup.manage
        
  @route "manageAnalytics",
    path: "/manage/analytics"
    template: "manage_analytics"
    onBeforeAction: ->
        setMenu subMenuItemsManage # TODO: subMenuItemsAnalytics
        return
    data: ->    
      templatesSetup.manage
        
  @route "manageHierarchy",
    path: "/manage/hierarchy"
    template: "manage_hierarchy"
    onBeforeAction: ->
        setMenu subMenuItemsManage # TODO: subMenuItemsHierarchy
        return          
    data: ->    
      templatesSetup.manage
        
  @route "managePersonnel",
    path: "/manage/personnel"
    template: "manage_personnel"
    onBeforeAction: ->
        setMenu subMenuItemsManage # TODO: subMenuItemsPersonnel
        return
    data: ->    
      templatesSetup.manage
        
  @route "manageSettings",
    path: "/manage/settings"
    template: "manage_settings"
    onBeforeAction: ->
        setMenu subMenuItemsManage # TODO: subMenuItemsASettings
        return    
    data: ->    
      templatesSetup.manage

  @route "manageSurveys",
    path: "/manage/surveys"
    template: "manage_surveys"
    onBeforeAction: ->
        setMenu subMenuItemsSurvey
        return
    data: ->    
      templatesSetup.manage

  @route "managesurveytask",
    path: "/manage/surveys/:_id"#"/manage/surveys/*"
    yieldTemplates: templatesSetup.templates
    onBeforeAction: ->
        #
        setMenu subMenuItemsSurvey
        return
    waitOn: ->   
      list_id = Session.get("list_id")
      # NOTE: this.params is available inside the waitOn function.
      [ Meteor.subscribe("surveylist"), Meteor.subscribe("survey", list_id) ]
    data: ->
      #templatesSetup.manage_surveys = Surveys.find()        
      templatesSetup.manage          
    onAfterAction: ->
        @render @params._id
        return
    ############ MANAGEMENT ###################
  return

  ###
  EXAMPLES 
  ###
  
  ###  
  # Multiple Parameters
  @route "twoSegments",
    
    # matches: '/posts/1/2'
    # matches: '/posts/3/4'
    path: "/posts/:paramOne/:paramTwo"

  
  # Optional Parameters
  @route "optional",
    
    # matches: '/posts/1'
    # matches: '/posts/1/2'
    path: "/posts/:paramOne/:optionalParam?"

  
  # query params are added as normal properties to this.params.
  # given a browser path of: '/posts/5?sort_by=created_at
  # this.params.sort_by => 'created_at'
  
  # the hash fragment is available on the hash property
  # given a browser path of: '/posts/5?sort_by=created_at#someAnchorTag
  # this.params.hash => 'someAnchorTag'
  
  # Anonymous Parameter Globbing
  @route "globbing",
    
    # matches: '/posts/some/arbitrary/path'
    # matches: '/posts/5'
    # route globs are available
    path: "/posts/*"

  
  # Named Parameter Globbing
  @route "namedGlobbing",
    
    # matches: '/posts/some/arbitrary/path'
    # matches: '/posts/5'
    # stores result in this.params.file
    path: "/posts/:file(*)"

  
  # Regular Expressions
  @route "regularExpressions",
    
    # matches: '/commits/123..456'
    # matches: '/commits/789..101112'
    path: /^\/commits\/(\d+)\.\.(\d+)/
  ###

