sap.ui.jsview "sap.ui.demo.myFiori.view.Master",
  getControllerName: ->
    "sap.ui.demo.myFiori.view.Master"

  createContent: (oController) ->
    new sap.m.Page(
      title: "{i18n>MasterTitle}"
      subHeader: new sap.m.Bar(contentLeft: [new sap.m.SearchField(
        search: [oController.handleSearch, oController]
        width: "100%"
      )])
      content: [new sap.m.List(
        id: "list"
        mode: "{device>/listMode}"
        select: [oController.handleListSelect, oController]
        items:
          path: "/SalesOrderCollection"
          template: new sap.m.ObjectListItem(
            type: "{device>/listItemType}"
            press: [oController.handleListItemPress, oController]
            title: "{SoId}"
            number: "{GrossAmount}"
            numberUnit: "{CurrencyCode}"
            attributes: [new sap.m.ObjectAttribute(text: "{BuyerName}")]
            firstStatus: new sap.m.ObjectStatus(
              text: "{BillingStatus}"
              state:
                path: "BillingStatus"
                formatter: sap.ui.demo.myFiori.util.Formatter.statusState
            )
          )
      )]
      footer: new sap.m.Bar(contentRight: [new sap.m.Button(
        icon: "sap-icon://group-2"
        press: ["handleViewSettings", oController]
      )])
    )
