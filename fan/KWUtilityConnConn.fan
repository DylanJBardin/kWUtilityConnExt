//
// Copyright (c) 2022, kW
// All Rights Reserved
//
// History:
//   4 Jul 22   Dylan   Creation
//

using haystack
using connExt
using skyarcd
**
** KWUtilityConnConn
**
public class KWUtilityConnConn : Conn
{
  new make(ConnActor actor, Dict rec) : super(actor, rec) {}

  override Obj? receive(ConnMsg msg) { return super.receive(msg) }

  override Void onOpen() {}

  override Void onClose() {}

  override Dict onPing() { Etc.emptyDict }

  
}