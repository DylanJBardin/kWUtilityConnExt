//
// Copyright (c) 2022, kW
// All Rights Reserved
//
// History:
//   4 Jul 22   Dylan   Creation
//

using haystack
using skyarcd
using connExt
using skyarc
**
** KWUtilityConn Extension
**
@ExtMeta
{
  name    = "kWUtilityConn"
  icon    = "app"
  depends = ["conn"]
}
const class KWUtilityConnExt : ConnImplExt
{
  @NoDoc new make() : super(KWUtilityConnModel()) {}
}
