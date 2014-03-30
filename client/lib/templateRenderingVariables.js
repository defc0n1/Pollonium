/*
  Variables specific for templates and languages
*/

// TODO: Konfigera språkspecifika strängar (sv/eng)

/*** COMPANY (GLOBAL) ***/
companyName = 'company';


/*** DASHBOARD ENVIRONMENT SETUP ***/
dashboardSetup = {
  'projectName': "COMPANY WEB POLL DASHBOARD",
  'projectDesc': "Welcome to the Company Web Poll Dashboard.",
  'menuItems':  [
                  {'item': 'Dashboard'},
                  {'item': 'Settings'},
                  {'item': 'Profile'},
                  {'item': 'Help'},
                  {'item': 'Per'}
                ],
  'yieldTemplates': {
                      'nav': {to: 'nav'},
                      'sidebar': {to: 'aside'},
                      'footer': {to: 'footer'}
                    }
};