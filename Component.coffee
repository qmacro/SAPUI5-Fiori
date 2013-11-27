jQuery.sap.declare "sap.ui.demo.myFiori.Component"
sap.ui.core.UIComponent.extend "sap.ui.demo.myFiori.Component",
  createContent: ->
    
    # create root view
    oView = sap.ui.view(
      id: "app"
      viewName: "sap.ui.demo.myFiori.view.App"
      type: "JS"
      viewData:
        component: this
    )
    
    # set data model on root view
    oModel = new sap.ui.model.json.JSONModel("model/mock.json")
    oView.setModel oModel
    
    # set i18n model
    i18nModel = new sap.ui.model.resource.ResourceModel(bundleUrl: "i18n/messageBundle.properties")
    oView.setModel i18nModel, "i18n"
    
    # set device model
    deviceModel = new sap.ui.model.json.JSONModel(
      isPhone: jQuery.device.is.phone
      listMode: (if (jQuery.device.is.phone) then "None" else "SingleSelectMaster")
      listItemType: (if (jQuery.device.is.phone) then "Active" else "Inactive")
    )
    deviceModel.setDefaultBindingMode "OneWay"
    oView.setModel deviceModel, "device"
    
    # done
    oView
