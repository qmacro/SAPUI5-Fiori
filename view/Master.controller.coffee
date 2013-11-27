jQuery.sap.require "sap.ui.demo.myFiori.util.Formatter"
jQuery.sap.require "sap.ui.demo.myFiori.util.Grouper"
sap.ui.controller "sap.ui.demo.myFiori.view.Master",
  onExit: ->
    if @_lineItemViewDialog
      @_lineItemViewDialog.destroy()
      @_lineItemViewDialog = null

  handleListItemPress: (evt) ->
    context = evt.getSource().getBindingContext()
    @nav.to "Detail", context

  handleSearch: (evt) ->
    
    # create model filter
    filters = []
    query = evt.getParameter("query")
    if query and query.length > 0
      filter = new sap.ui.model.Filter("SoId", sap.ui.model.FilterOperator.Contains, query)
      filters.push filter
    
    # update list binding
    list = @getView().byId("list")
    binding = list.getBinding("items")
    binding.filter filters

  handleListSelect: (evt) ->
    context = evt.getParameter("listItem").getBindingContext()
    @nav.to "Detail", context

  handleViewSettings: (evt) ->
    
    # create dialog
    that = this
    unless @_lineItemViewDialog
      @_lineItemViewDialog = new sap.m.ViewSettingsDialog(
        groupItems: [new sap.m.ViewSettingsItem(
          text: "Price"
          key: "GrossAmount"
        ), new sap.m.ViewSettingsItem(
          text: "Status"
          key: "BillingStatus"
        )]
        confirm: (evt) ->
          aSorters = []
          mParams = evt.getParameters()
          if mParams.groupItem
            sPath = mParams.groupItem.getKey()
            bDescending = mParams.groupDescending
            vGroup = sap.ui.demo.myFiori.util.Grouper[sPath]
            aSorters.push new sap.ui.model.Sorter(sPath, bDescending, vGroup)
          oBinding = that.getView().byId("list").getBinding("items")
          oBinding.sort aSorters
      )
    
    # open dialog
    @_lineItemViewDialog.open()
