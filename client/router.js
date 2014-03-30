/* Set up Iron Router to render default layout templates (jade)
 *  https://github.com/EventedMind/iron-router/blob/master/DOCS.md
 *  Once you add the iron-router package the global Router object is
 *  available on the client and on the server. So you can create your
 *  routes and configure the router outside of your Meteor.isClient and
 *  Meteor.isServer blocks. Or, if you are only going to be using client
 *  side routes, it's okay to put the routing code in your client/ folder.
 */

// Specific variables for templates used here are imported from 
// lib/templateRenderingVariables.js automatically

Router.configure({
    layoutTemplate: 'layout' /*,
     notFoundTemplate: 'notFound',
     loadingTemplate: 'loading' */
});

Router.map(function () {
    this.route('home', {
      
      path: '/', // match the root path
      template: 'hello', // will map the domain url (the / path) and automatically render the template .
      // layoutTemplate: 'layout', // redundant here
      
      // region-specific templates
      yieldTemplates: {
        'nav': {to: 'nav'},
        'sidebar': {to: 'aside'},
        'footer': {to: 'footer'}
      }      
    });
  
    this.route('dashboard', {
      // path: '/dashboard', // redundant
      template: 'hello', 
      // layoutTemplate: 'layout', // redundant here
      
      // region-specific templates
      yieldTemplates: dashboardSetup['yieldTemplates'],
        
      data: function () {
        // this.params is available inside the data function
        var params = this.params;

        return {
          company: companyName,
          projectName: dashboardSetup['projectName'],
          description: dashboardSetup['projectDesc'],
          sidebarItems: dashboardSetup['sidebarItems'],
          menuItems: dashboardSetup['menuItems']
        }
      }
    });

    /*        EXAMPLES           *

     // No Parameters
     this.route('posts', {
     // matches: '/posts'
     // redundant since the name of the route is posts
     path: '/posts'
     });

     // One Required Parameter
     this.route('postShow', {
     // matches: '/posts/1'
     path: '/posts/:_id'
     });

     // Multiple Parameters
     this.route('twoSegments', {
     // matches: '/posts/1/2'
     // matches: '/posts/3/4'
     path: '/posts/:paramOne/:paramTwo'
     });

     // Optional Parameters
     this.route('optional', {
     // matches: '/posts/1'
     // matches: '/posts/1/2'
     path: '/posts/:paramOne/:optionalParam?'
     });

     this.route('postShow', {
     path: '/posts/:_id',
     data: function () {
     // the data function is an example where this.params is available

     // we can access params using this.params
     // see the below paths that would match this route
     var params = this.params;

     // query params are added as normal properties to this.params.
     // given a browser path of: '/posts/5?sort_by=created_at
     // this.params.sort_by => 'created_at'

     // the hash fragment is available on the hash property
     // given a browser path of: '/posts/5?sort_by=created_at#someAnchorTag
     // this.params.hash => 'someAnchorTag'
     }
     });

     // Anonymous Parameter Globbing
     this.route('globbing', {
     // matches: '/posts/some/arbitrary/path'
     // matches: '/posts/5'
     // route globs are available
     path: '/posts/*'
     });

     // Named Parameter Globbing
     this.route('namedGlobbing', {
     // matches: '/posts/some/arbitrary/path'
     // matches: '/posts/5'
     // stores result in this.params.file
     path: '/posts/:file(*)'
     });

     // Regular Expressions
     this.route('regularExpressions', {
     // matches: '/commits/123..456'
     // matches: '/commits/789..101112'
     path: /^\/commits\/(\d+)\.\.(\d+)/
     });
     */
});