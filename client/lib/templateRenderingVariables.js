/*
  Variables specific for templates and languages
*/

// TODO: Konfigera språkspecifika strängar (sv/eng)

/*** COMPANY (GLOBAL) ***/
companyName = 'company';


/*** DASHBOARD ENVIRONMENT SETUP ***/
dashboardSetup = {
                  'company': companyName,
                  'projectName': "COMPANY WEB POLL DASHBOARD",
                  'description': "Welcome to the Company Web Poll Dashboard.",
                  'pageHeader': 'WEB POLL DASHBOARD',
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
};

templatesSetup =   {
                      'nav': {to: 'nav'},
                      'sidebar': {to: 'aside'},
                      'footer': {to: 'footer'}
                    }