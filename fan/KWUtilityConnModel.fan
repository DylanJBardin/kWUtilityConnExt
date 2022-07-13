//
// Copyright (c) 2022, kW
// All Rights Reserved
//
// History:
//   4 Jul 22   Dylan   Creation
//

using haystack
using connExt

**
** KWUtilityConnModel
**
@Js
const class KWUtilityConnModel : ConnModel
{
  new make() : super(KWUtilityConnModel#.pod)
  {
    connProto = Etc.makeDict([
      "dis": "KWUtilityConn Conn",
      "kWUtilityConnConn": Marker.val,
      "username": "",
      "uri": `http://host/kWUtilityConn/`,
    ])
  }

  override const Dict connProto
  override Type? pointAddrType() { Str# }
  override Bool isPollingSupported() { true }
  override Bool isCurSupported() { true }
}

