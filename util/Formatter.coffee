jQuery.sap.declare "sap.ui.demo.myFiori.util.Formatter"
jQuery.sap.require "sap.ui.core.format.DateFormat"

sap.ui.demo.myFiori.util.Formatter =
  _statusStateMap:
      Neu: "Warning"
      Initial: "Success"

  statusState: (value) ->
    map = sap.ui.demo.myFiori.util.Formatter._statusStateMap
    (if (value and map[value]) then map[value] else "None")

  date: (value) ->
    if value
      oDateFormat = sap.ui.core.format.DateFormat.getDateTimeInstance(pattern: "yyyy-MM-dd")
      oDateFormat.format new Date(value)
    else
      value

  quantity: (value) ->
    try
      return (if (value) then parseFloat(value).toFixed(0) else value)
    catch err
      return "Not-A-Number"