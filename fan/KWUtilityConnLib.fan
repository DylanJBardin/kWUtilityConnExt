//
// Copyright (c) 2022, kW
// All Rights Reserved
//
// History:
//   4 Jul 22   Dylan   Creation
//

using haystack
using axon::Axon
using skyarcd
using web
using util
using hx
**
** Axon functions for kWUtilityConn
**
const class KWUtilityConnLib
{
  **
  @Axon
    static Str kWHttp(Uri url, Dict? headers := null, Str? body := null,
                      Str? methodType:= null, Str? username:=null, Str? auth:=null) {

        c := WebClient(url)

        if(methodType == "GET" )c.reqMethod = "GET"
        else if(methodType == "POST" )c.reqMethod = "POST"
        else if(methodType == "PUT" )c.reqMethod = "PUT"
        else if(methodType == "PATCH" )c.reqMethod = "PATCH"
        else if(methodType == "DELETE" )c.reqMethod = "DELETE"

        if(headers != null){
            headers.each |v,k| {
               c.reqHeaders[k] = v

            }
        }
        if(username != null && auth != null){
          c.authBasic(username, auth)
        }
        c.writeReq

        if(body != null && headers != null){
            if(!headers.has("Content-Type")) throw ArgErr(
              "If body included, Must specify header for Content-Type ie:" +
              " \"Content-Type\":\"application/json\"")
            c.reqOut.print(body).close
        }

        // echo("dcHttp request sent")
        c.readRes
        // echo("response: " + c.resStr)
        return(c.resStr)

    }

  ** Test stub function
  **
  @Axon
  static Obj kWUtilityConnMeters(Ref id)
  {
        //Authorization Piece of API
        uri:= "https://utilityapi.com/api/v2/authorizations".toUri
        headers:= Etc.makeDict(["Authorization":"Bearer fe81dd7b04684243a28718669eff99a8"])
        body:= null
        methodType:= "GET"
        response:= kWHttp(uri, headers, body, methodType)
        
        parsedJson:= JsonReader(((response).toStr).in).readVal
        authGrid:= ((Etc.toGrid(parsedJson)).get(0)->authorizations)
        proj:= Context.cur.proj
        Str pass:= proj.passwords.get(id.toStr)
        //echo(Env.parent)
        meter := (Etc.toGrid(authGrid).findAll |k| {k.trap("is_archived")==false}).findAll |r| {r.trap("uid")==pass}
        //-------------------------------------------------------------

        //Get All Matching Meters
        uri = "https://utilityapi.com/api/v2/meters".toUri
        headers = Etc.makeDict(["Authorization":"Bearer fe81dd7b04684243a28718669eff99a8"])
        body = null
        methodType = "GET"

        response= kWHttp(uri, headers, body, methodType)
        
        parsedJson:= JsonReader(((response).toStr).in).readVal
        
        meterGrid := ((Etc.toGrid(parsedJson)).get(0)->meters)
        
        meter:= Etc.toGrid(Etc.toGrid(meterGrid).findAll |k| {k.trap("is_archived")==false})

        matchingMeter:= Etc.toGrid(newMeters.findAll |j| {j.trap("authorization_uid")==pass}).get(0)->uid
        //-------------------------------------------------------------
        
        //
        uri = "https://utilityapi.com/api/v2/bills?meters=".toUri
        headers = Etc.makeDict(["Authorization":"Bearer fe81dd7b04684243a28718669eff99a8"])
        body = null
        methodType = "GET"

        response= kWHttp(uri, headers, body, methodType)
        
        parsedJson:= JsonReader(((response).toStr).in).readVal
        
        billGrid := Etc.toGrid((Etc.toGrid(data5)).get(0)->bills)
        
        return Etc.toGrid(data6.colToList("base"))
    }
  }

