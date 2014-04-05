#
#  Variables and classes specific for templates and languages
#  Placed in lib/helpers for load order
#
#  The @-sign will make an object global (this) inside a package
#    @foo = "hello" 
#  Experimental feature: share will make foo global:
#    share.foo = "hello"
#  the root-declaration below will do the same thing
#    root = exports ? this
#    root.foo = "hello"
#


# Declare global namespace (Coffeescript doesn't allow global variables) for global access
# This will make data available for import from other modules
#root = exports ? this


# Name of your company (globally used) 
@companyName = "COMPANY" 
@pollYear = 2014 # TODO: Load from collectison instead? set when survey-creating..


# TemplateSetup - superclass #
# There are 4 main functions of Pollonium:
# *   administrating the system  
# *   using the survey
# *   managing the survey
# *   analyzing the survey
# *
# *   Every template setup comes with two languages
# 
TemplateSetup = ->
  @admin = {}
  @survey = {}
  @manage = {}
  @analyze = {}
  @templates = {}
  return


# Create new global instance of 'class'
@templatesSetup = new TemplateSetup()

# Specify which templates to yield by default
@templatesSetup.templates =
  nav:
    to: "nav"
  sidebar:
    to: "aside"
  footer:
    to: "footer"
  description:
    to: "description"
  pageheader:
    to: "pageheader" 

