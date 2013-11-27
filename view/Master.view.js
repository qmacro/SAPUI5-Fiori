sap.ui.jsview("sap.ui.demo.myFiori.view.Master", {

    getControllerName: function () {
        return "sap.ui.demo.myFiori.view.Master";
    },
    
    createContent: function (oController) {
        
        var oItem = new sap.m.ObjectListItem({
            type: "{device>/listItemType}",
            press: oController.handleListItemPress,
            title: "{SoId}",
            number: "{GrossAmount}",
            numberUnit: "{CurrencyCode}",
            attributes: [
                new sap.m.ObjectAttribute({
                    text: "{BuyerName}"
                })
            ],
            firstStatus: [
                new sap.m.ObjectStatus({
                    text: "{BillingStatus}",
                    state: {
                        path: "BillingStatus",
                        formatter: new sap.ui.demo.myFiori.util.Formatter.statusState()
                    }
                })
            ]
        });

        return new sap.m.Page({
            title: "{i18n>MasterTitle}",
            subHeader: new sap.m.Bar({
                contentLeft: [
                    new sap.m.SearchField({
                        search: ["handleSearch", oController],
                        width: "100%"
                    })
                ]
            }),
            content: [
                new sap.m.List({
                    id: "list",
                    mode: "{device>/listMode}",
                    select: ["handleListSelect", oController],
                    items: {
                        path: "/SalesOrderCollection",
                        template: oItem
                    }
                })
            ],
            footer: new sap.m.Bar({
                contentRight: [
                    new sap.m.Button({
                        icon: "sap-icon://group-2",
                        press: ["handleViewSettings", oController]
                    })
                ]
            })
        });
    }

});