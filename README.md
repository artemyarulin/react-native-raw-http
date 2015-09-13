# react-native-raw-http
React native library for low level interaction with API for HTTP, such as manual redirect handling and manual cookie management

# Why
`react-native` team decied to follow as close as possible `XMLHTTPRequest` and `fetch` API for all network requests. While it is a good idea and brings a lot of existing `JavaScript` library to `react-native` world there are a set of limitation because of it:

- [Redirect allways followed automatically](https://github.com/facebook/react-native/issues/929) - in case you would like to catch redirect - there it now way to do that as `XMLHttpRequest` blindly follows them by design and there is no way to catch it
- [Cookies managed automatically](https://github.com/facebook/react-native/issues/1274) - cookies managed by iOS network stack, no way to handle cookies from your business logic on `JavaScript`. There is a project [react-native-cookies](https://github.com/joeferraro/react-native-cookies) which allows you to manage cookies, but in my opinion it is just a workaround of a fact that cookies are always accepted

# Example

``` js
let rawHttp = require('react-native-raw-http')

// Assume server http://example.com returns HTTP 302 Redirect to https://example.com/404
rawHttp('http://example.com',{autoRedirect:false,cookieHandled:null},(err,headers,resp) => {
   console.log(`error: ${err} \n
                headers: ${headers} \n
                resp: ${resp}`)
})

/* Outputs first when headers got received:
  error: null,
  headers: { "Status": 302,        // Notice that status code returned as a separate field
             "Content-Length":0,
             "Set-Cookie": "testCookie=true", // Set-Cookies is just a header
             "Location":"http://example.com/404" }
  resp: null

  //Callback got called second time with body received
  error: null,
  headers: { "Status": 302,
             "Content-Length":0,
             "Location":"http://example.com/404" },
  resp: "" // Server returned empty text
*/

```

# API

`rawHttp(url,options,callback)` where:
- `(string)url` - is url to request
- `(object)options` is a object which can have following properties:
  - `(string)method` - Http method like `GET`,`POST`
  - `(bool)autoRedirects` - when set to `true` automatically follows redirect
  - `(function(cookies,headers,url))cookieHandler` - functions which will be called when server reterned `Set-Cookie` header. Function will be called with list of cookies, headers and url of the request
- `(function(err,headers,resp))cb` - callback which will be called separatly for each received HTTP headers and HTTP body. If `autoRedirects` set to true callback will be called for new location headers and body as well
