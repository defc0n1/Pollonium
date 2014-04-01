#
#  Variables specific for templates and languages
#


# Declare global namespace (Coffeescript doesn't allow global variables) for global access
root = exports ? this
# This will declare our function foo in the global namespace
#root.foo = -> 'Hello World'




###
Name of your company (globally used) **
###
companyName = "COMPANY"
pollYear = 2014


# TemplateSetup - superclass //
# There are 4 main functions of Pollonium:
# *   administrating the system  
# *   using the survey
# *   managing the survey
# *   analyzing the survey
# *   Every template setup comes with two languages
# 
root.TemplateSetup = ->
  @admin =
    swe: {}
    eng: {}

  @survey =
    swe: {}
    eng: {}

  @manage =
    swe: {}
    eng: {}

  @analyze =
    swe: {}
    eng: {}

  @templates = {}
  return



# Create new instance of 'class'
root.templatesSetup = new TemplateSetup()

# Specify which templates to yield by default
root.templatesSetup.templates =
  nav:
    to: "nav"

  sidebar:
    to: "aside"

  footer:
    to: "footer"


###
Survey management setup ENG **
###
root.templatesSetup.manage["eng"] =
  company: companyName
  year: pollYear
  navTitle: "MANAGE"
  projectName: "COMPANY WEB POLL MANAGEMENT"
  description: "Welcome to the Company Web Poll Management Dashboard."
  pageHeader: "WEB POLL DASHBOARD"
  menuItems: [
    {
      item: "DASHBOARD"
    }
    {
      item: "SETTINGS"
    }
    {
      item: "PROFILE"
    }
    {
      item: "HELP"
    }
    {
      item: "Per"
    }
  ]
  sidebarItems: [
    {
      item: "HELP"
    }
    {
      item: "Text 2"
    }
    {
      item: "Text 3"
    }
    {
      item: "Text 4"
    }
    {
      item: "Text 5"
    }
  ]


###
Survey management setup SWE **
###
root.templatesSetup.manage["swe"] =
  company: companyName
  projectName: "WEBBENKÄT: ADMINSTRERING"
  description: "Välkommen till kontrollpanelen för webbenkäter."
  pageHeader: "WEBBENKÄT: KONTROLLPANEL"
  menuItems: [item: "KONTROLLPANEL"]
  sidebarItems: [item: "Text"]