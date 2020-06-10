# SweetURLRequest

`SweetURLRequest` provides convenience methods to setup an [URLRequest](https://developer.apple.com/documentation/foundation/urlrequest).

## Features

### HTTP method

Pass the method using an enum:

```swift
URLRequest(
    method: .post,
    url: URL(string: "http://www.example.com")!
)
```

### HTTP headers

Properties to set common HTTP headers:

```swift
var request = URLRequest(url: URL(string: "http://www.example.com")!)
request.headers.accept = .json
request.headers.contentType = .xml
request.headers.authorization = "Bearer xyz"
```

### Parameters

```swift
URLRequest(
    method: .get,
    url: URL(string: "http://www.example.com")!,
    parameters: ["param1" : "äöü", "param2" : "foo bar"]
)
```

Parameters will be URL-encoded for GET/HEAD/DELETE and sent as application/x-www-form-urlencoded body for other methods by default.

### JSON as HTTP body

```swift
URLRequest(
    method: .post,
    url: URL(string: "http://www.example.com")!,
    jsonBody: Person(name: "Bob")
)
```

This automatically uses JSONEncoder to serialize the given object and sets an appropriate Content-Type header.
