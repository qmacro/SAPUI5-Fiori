sap.ui.controller "sap.ui.demo.myFiori.view.App",
  
  ###
  Navigates to another page
  @param {string} pageId The id of the next page
  @param {sap.ui.model.Context} context The data context to be applied to the next page (optional)
  ###
  to: (pageId, context) ->
    app = @getView().app
    
    # load page on demand
    master = ("Master" is pageId)
    if app.getPage(pageId, master) is null
      page = sap.ui.view(
        id: pageId
        viewName: "sap.ui.demo.myFiori.view." + pageId
        type: "XML"
      )
      page.getController().nav = this
      app.addPage page, master
      jQuery.sap.log.info "app controller > loaded page: " + pageId
    
    # show the page
    app.to pageId
    
    # set data context on the page
    if context
      page = app.getPage(pageId)
      page.setBindingContext context

  
  ###
  Navigates back to a previous page
  @param {string} pageId The id of the next page
  ###
  back: (pageId) ->
    @getView().app.backToPage pageId
