# SweetURLRequest

`SweetURLRequest` provides convenience methods for creating [URLRequests](https://developer.apple.com/documentation/foundation/urlrequest):

⚡HTTP method as enum  
⚡Properties to set common HTTP headers  
⚡URL/Form/JSON encoded parameters

## HTTP method as enum  

```swift
URLRequest(
    method: .post,
    url: URL(string: "http://www.example.com")!
)
```

## Properties to set common HTTP headers

```swift
var request = URLRequest(url: URL(string: "http://www.example.com")!)
request.headers.accept = .json
request.headers.contentType = .xml
request.headers.authorization = "Bearer xyz"
```

## URL/Form/JSON encoded parameters

Parameters will be URL-encoded for GET/HEAD/DELETE and sent as application/x-www-form-urlencoded body for other methods by default:

```swift
URLRequest(
    method: .get,
    url: URL(string: "http://www.example.com")!,
    parameters: ["param1" : "äöü", "param2" : "foo bar"]
)
```

You can also pass a JSON body, this will use JSONEncoder to serialize the given data and sets an appropriate Content-Type header:

```swift
URLRequest(
    method: .post,
    url: URL(string: "http://www.example.com")!,
    jsonBody: Person(name: "Bob")
)
```

