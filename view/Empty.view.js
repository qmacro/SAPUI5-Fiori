sap.ui.jsview("sap.ui.demo.myFiori.view.Empty", {

    createContent: function (oController) {
        
        return new sap.m.Page({
            showHeader: false,
            footer: new sap.m.Bar()
        });
    }

});