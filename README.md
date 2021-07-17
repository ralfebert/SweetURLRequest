# SweetURLRequest

SweetURLRequest simplifies common cases for creating an URLRequest and handling HTTPURLResponse.

Extensions for URLRequest:

⚡ Constants for HTTP methods  
⚡ Properties to set common HTTP headers  
⚡ URL/Form/JSON encoded parameters  

Extensions for HTTPURLResponse:

⚡ Check for a 2xx success status code  
⚡ Handle HTTP status codes via switch/case  
⚡ Error enum for HTTP status codes

## Examples

### Example project

 [MetMuseumEndpoints: A Swift package for the The Metropolitan Museum of Art Collection API](https://github.com/ralfebert/MetMuseumEndpoints)

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

### Check for a success status code in the 2xx range

```swift
func expectSuccess(response: URLResponse) throws {
    let status = (response as! HTTPURLResponse).status
    guard status.responseType == .success else { throw status }
}
```

### Handle HTTP status codes via switch/case, throw a status code as Error

```swift
func validate(response: URLResponse) throws {
    let status = (response as! HTTPURLResponse).status

    guard status.responseType == .success else {
        switch status {
        case .unauthorized:
            print("Unauthorized")
        default:
            print("Non-success status: \(status)")
        }
        throw status
    }
}
```
