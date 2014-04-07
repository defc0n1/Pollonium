# Set up dependencies so that sidebar can be reactive - won't re-render otherwise!
@subMenu = {}
@subMenuDeps = new Deps.Dependency

@setMenu = (m) ->
    @subMenu = m
    subMenuDeps.changed()
    return

@subTitle = ""
@subTitleDeps = new Deps.Dependency

@setTitle = (t) ->
    @subTitle = t
    subTitleDeps.changed()
    return
