jQuery.sap.declare "sap.ui.demo.myFiori.util.Grouper"

sap.ui.demo.myFiori.util.Grouper =
  BillingStatus: (oContext) ->
    status = oContext.getProperty("BillingStatus")
    key: status
    text: status

  GrossAmount: (oContext) ->
    price = oContext.getProperty("GrossAmount")
    currency = oContext.getProperty("CurrencyCode")
    key = undefined
    text = undefined
    if price <= 5000
      key = "LE10"
      text = "< 5000 " + currency
    else if price <= 10000
      key = "LE100"
      text = "< 10.000  " + currency
    else
      key = "GT100"
      text = "> 10.000 " + currency
    key: key
    text: text