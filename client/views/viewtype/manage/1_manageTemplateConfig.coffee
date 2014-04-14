## English configuration of management templates




#######################################
### Pollonium tasks management setup  #
#######################################
templatesSetup.manage =
  company: companyName
  year: pollYear
  navTitle: "submenu.navtitle"
  projectName:  "manage.projectname"
  description: "manage.description"
  pageHeader: "manage.pageheader"
  subHeader: "manage.subheader"
  leadTextSignedIn: "manage.leadtext.signedin"
  leadTextNotSignedIn: "manage.leadtext.notsignedin"
  coreRoute: "manage" # escape hatch
  rootUrl: Meteor.absoluteUrl()
  menu: { 
        menuItems: []
        subMenuItems: []
        }
  surveyItems: {}
  surveyList: {}
 


