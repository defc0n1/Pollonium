## English configuration of management templates


###################################
### Survey management setup ENG   #
###################################
templatesSetup.manage["eng"] =
  company: companyName
  year: pollYear
  navTitle: "MANAGE"
  projectName: "COMPANY WEB POLL MANAGEMENT"
  description: "Welcome to the Company Web Poll Management Dashboard."
  pageHeader: "WEB POLL DASHBOARD"
  #menuStrings: { menu: { dashboard: "DASHBOARD", settings: "SETTINGS", profile: "PROFILE"} }
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
templatesSetup.manage["swe"] =
  company: companyName
  projectName: "WEBBENKÄT: ADMINSTRERING"
  description: "Välkommen till kontrollpanelen för webbenkäter."
  pageHeader: "WEBBENKÄT: KONTROLLPANEL"
  menuItems: [item: "KONTROLLPANEL"]
  sidebarItems: [item: "Text"]