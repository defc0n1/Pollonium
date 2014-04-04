# Router configuration for app #
#
# CoffeeScript is a dialect of JavaScript. It compiles to JavaScript.
# Uses syntactic sugar on top of JS for readability
# http://coffeescript.org/

# Specific variables for templates used here are imported from 
# lib/templatesConfig.coffee, automatically by Meteor

Router.configure 
    layoutTemplate: "layout", #
    notFoundTemplate: 'not-found', # TODO
    loadingTemplate: 'loading'  # TODO

Router.map ->
  @route "survey",
    # *** EXAMPEL ROUTE ****/ TODO: MAKE POLLONIUM MANAGER ACCOUNT HERE?
    path: "/" # match the root path
    template: "survey" # will map the domain url (the / path) and automatically render the template .
    # layoutTemplate: 'layout', // redundant here
    yieldTemplates: templatesSetup.templates # // region-specific templates, load default templates

  @route "manage",
    # path: '/manage', // redundant
    template: "manage"
    yieldTemplates: templatesSetup.templates
    data: ->    
      # this.params is available inside the data function
      #var params = this.params; // choose returns differently depending on input from user ?     

      templatesSetup.manage.menu.menuItems = menuItemsManage
      templatesSetup.manage.menu.subMenuItems = subMenuItemsManage
        
      #console.dir subMenuItemsManage
      #console.dir menuItemsManage
      #console.dir templatesSetup.manage
      #console.dir templatesSetup.templates
      
      templatesSetup.manage # 
    #action: ->
            # TODO: Disable menu/s, set language string
            # 
  @route "manageAccounts",
    path: "/manage/accounts"
    template: "manage-accounts"
    yieldTemplates: templatesSetup.templates
    data: ->    
      templatesSetup.manage
    #action: ->
    #
  @route "manageAnalytics",
    path: "/manage/analytics"
    template: "manage-analytics"
    yieldTemplates: templatesSetup.templates
    data: ->    
      templatesSetup.manage
    #action: ->  
  
  @route "manageHierarchy",
    path: "/manage/hierarchy"
    template: "manage-hierarchy"
    yieldTemplates: templatesSetup.templates
    data: ->    
      templatesSetup.manage
    #action: ->          

  @route "managePersonnel",
    path: "/manage/personnel"
    template: "manage-personnel"
    yieldTemplates: templatesSetup.templates
    data: ->    
      templatesSetup.manage
    #action: ->
  
  @route "manageSettings",
    path: "/manage/settings"
    template: "manage-settings"
    yieldTemplates: templatesSetup.templates
    data: ->    
      templatesSetup.manage
    #action: -> 
    #
  @route "manageSurveys",
    path: "/manage/surveys"
    template: "manage-surveys"
    yieldTemplates: templatesSetup.templates
    data: ->    
      templatesSetup.manage
    #action: ->  
        
  @route "manageSurveyTask",
    path: "/manage/survey/*"
    #action: ->
        # TODO: this.render(this.params), this.yieldTemplates: templateSetup
  return
  
  ###
  EXAMPLES 
  ###
  
  ###  
  # One Required Parameter
  @route "postShow",
    
    # matches: '/posts/1'
    path: "/posts/:_id"

  
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

  @route "postShow",
    path: "/posts/:_id"
    data: ->
      
      # the data function is an example where this.params is available
      
      # we can access params using this.params
      # see the below paths that would match this route
      params = @params
      return

  
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

