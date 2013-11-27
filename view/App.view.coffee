sap.ui.jsview "sap.ui.demo.myFiori.view.App",
  getControllerName: ->
    "sap.ui.demo.myFiori.view.App"

  createContent: (oController) ->
    
    # to avoid scroll bars on desktop the root view must be set to block display
    @setDisplayBlock true
    
    # create app
    @app = new sap.m.SplitApp()
    
    # load the master page
    master = sap.ui.jsview("Master", "sap.ui.demo.myFiori.view.Master")
    master.getController().nav = @getController()
    @app.addPage master, true
    
    # load the empty page
    empty = sap.ui.xmlview("Empty", "sap.ui.demo.myFiori.view.Empty")
    @app.addPage empty, false
    
    # wrap app with shell
    new sap.m.Shell("Shell",
      title: "{i18n>ShellTitle}"
      showLogout: false
      app: @app
    )
