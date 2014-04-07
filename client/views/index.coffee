# Here goes JS specifically for index.jade

# Set up helpers for reactive sidebar   
Template.sidebar.subTitle = ->
  Deps.depend subTitleDeps
  subTitle
    
Template.sidebar.getItems = ->
  Deps.depend subMenuDeps
  subMenu