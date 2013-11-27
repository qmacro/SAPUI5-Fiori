jQuery.sap.require "sap.ui.demo.myFiori.util.Formatter"
jQuery.sap.require "sap.m.MessageBox"
jQuery.sap.require "sap.m.MessageToast"
sap.ui.controller "sap.ui.demo.myFiori.view.Detail",
  handleNavButtonPress: (evt) ->
    @nav.back "Master"

  handleApprove: (evt) ->
    
    # show confirmation dialog
    bundle = @getView().getModel("i18n").getResourceBundle()
    sap.m.MessageBox.confirm bundle.getText("ApproveDialogMsg"), ((oAction) ->
      if sap.m.MessageBox.Action.OK is oAction
        
        # notify user
        successMsg = bundle.getText("ApproveDialogSuccessMsg")
        sap.m.MessageToast.show successMsg
    
    # TODO call proper service method and update model (not part of this session)
    ), bundle.getText("ApproveDialogTitle")

  handleLineItemPress: (evt) ->
    context = evt.getSource().getBindingContext()
    @nav.to "LineItem", context
