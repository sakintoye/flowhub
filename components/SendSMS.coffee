noflo = require 'noflo'
ajax = require 'ajax-request'

exports.getComponent = ->
  new noflo.Component
    description: "Forward received data"
    inPorts:
      in:
        datatype: 'object'
        description: 'An input port'
    outPorts:
      out:
        datatype: 'all'
        description: 'An output port'
    process: (input, output) ->
      return unless input.has 'in'
      data = input.getData 'in'
      data = JSON.parse(data)
      url = "https://billing.fractel.net/cgi-bin/fracteladminservice.cgi?action=SENDMMS3&fromuser=3212520149&mediafile=&message=" + data.message + "&outputformat=json&password=3060439019&touser= " + data.phone + "&username=2005551524"
      xurl = url
      #@callb = (myArgument, myOtherArgument, endd) ->
      #     cc = 5
      # #ajax.post(xurl, => @callb)
      ajax xurl, (myArgument, myOtherArgument, endd) ->
        cc = 5
        console.log(data.message)
        output.send data
        output.done()