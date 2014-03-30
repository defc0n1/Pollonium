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
                  {'item': 'DASHBOARD'},
                  {'item': 'SETTINGS'},
                  {'item': 'PROFILE'},
                  {'item': 'HELP'},
                  {'item': 'Per'}
                ],
  'sidebarItems':  [
                    {'item': 'Text'},
                    {'item': 'Text 2'},
                    {'item': 'Text 3'},
                    {'item': 'Text 4'},
                    {'item': 'Text 5'}
                  ],
  'yieldTemplates': {
                      'nav': {to: 'nav'},
                      'sidebar': {to: 'aside'},
                      'footer': {to: 'footer'}
                    }
};