#! /usr/bin/env fan
//
// Copyright (c) 2022, kW
// All Rights Reserved
//
// History:
//   4 Jul 22   Dylan   Creation
//

using build

**
** Build: kWUtilityConnExt
**
class Build : BuildPod
{
  new make()
  {
    podName = "kWUtilityConnExt"
    summary = "TODO: summary of pod name..."
    version = Version("1.0")
    meta    = [
                "org.name":     "kW",
                //"org.uri":      "http://kW-Engineering.com/",
                //"proj.name":    "Utility Conn",
                //"proj.uri":     "TBD",
                "license.name": "Commercial",
              ]
    depends = [
              "sys 1.0",
              "haystack 3.1",
              "folio 3.1",
              "axon 3.1",
              "skyarcd 3.1",
              "connExt 3.1",
              "haystack 3.0+",
              "util 1.0+",
              "web 1.0+",
              "hx 1.0+",
              "skyarc 3.0+"
              ]
    srcDirs = [
              `fan/`,
              `test/`
              ]

    resDirs = [
              `locale/`,
               `lib/`
              ]
    index   =
    [
      "skyarc.ext": "kWUtilityConnExt::KWUtilityConnExt",
      "skyarc.lib": "kWUtilityConnExt::KWUtilityConnLib",
      "ph.lib": "KWUtilityConn"
    ]
  }
}
