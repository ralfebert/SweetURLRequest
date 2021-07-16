# SweetURLRequest

`SweetURLRequest` provides convenience methods for creating an [URLRequest](https://developer.apple.com/documentation/foundation/urlrequest):

⚡ Constants for HTTP methods  
⚡ Properties to set common HTTP headers  
⚡ URL/Form/JSON encoded parameters
⚡ Enums to check HTTP status codes via switch/case

## Examples

### Constants for HTTP methods

```swift
URLRequest(
    method: .post,
    url: URL(string: "http://www.example.com")!
)
```

### Properties to set common HTTP headers

```swift
var request = URLRequest(url: URL(string: "http://www.example.com")!)
request.headers.accept = .json
request.headers.contentType = .xml
request.headers.authorization = "Bearer xyz"
```

### URL/Form/JSON encoded parameters

Parameters will be URL-encoded for GET/HEAD/DELETE and sent as application/x-www-form-urlencoded body for other methods by default:

```swift
URLRequest(
    method: .get,
    url: URL(string: "http://www.example.com")!,
    parameters: ["param1" : "äöü", "param2" : "foo bar"]
)
```

You can also pass a JSON body, this will use JSONEncoder to serialize the given data and set an appropriate Content-Type header:

```swift
try URLRequest(
    method: .post,
    url: URL(string: "http://www.example.com")!,
    jsonBody: Person(name: "Bob")
)
```

### Enums to check HTTP status codes via switch/case

```swift
guard let httpResponse = response as? HTTPURLResponse else { return }

let status = httpResponse.status

guard status.responseType == .success else {
    switch status {
    case .unauthorized:
        print("Unauthorized")
    default:
        print("Other non-success status: \(status)")
    }
    return
}

print("Handle success result")
```
