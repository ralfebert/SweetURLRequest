# SweetURLRequest

`SweetURLRequest` provides convenience methods to setup an [URLRequest](https://developer.apple.com/documentation/foundation/urlrequest):

## Setting the HTTP method

SweetURLRequest provides a typesafe enum for setting the HTTP method:

```swift
URLRequest(method: .post, url: URL(string: "http://www.example.com")!)
```

## Setting HTTP headers

SweetURLRequest provides typed properties to set common HTTP headers:

```swift
var request = URLRequest(url: URL(string: "http://www.example.com")!)
request.headers.accept = ContentType.json
request.headers.contentType = ContentType.xml
```

## Sending parameters

```swift
let request = URLRequest(
    method: .get,
    url: URL(string: "http://www.example.com")!,
    parameters: ["param1" : "äöü", "param2" : "foo bar"]
)
```

Parameters will be URL-encoded for GET/HEAD/DELETE and sent as application/x-www-form-urlencoded body for other methods by default.
