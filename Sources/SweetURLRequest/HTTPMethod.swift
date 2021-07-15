/**
 Enum to represent a HTTP request method.

 Generated from https://developer.mozilla.org/de/docs/Web/HTTP/Methods
 */
public struct HTTPMethod: Equatable, Hashable {

    public let name: String

    /** The GET method requests a representation of the specified resource. Requests using GET should only retrieve data. */
    public static let get = HTTPMethod(name: "GET")

    /**
     The HEAD method asks for a response identical to that of a GET request, but without the response body.
     */
    public static let head = HTTPMethod(name: "HEAD")

    /**
     The POST method is used to submit an entity to the specified resource, often causing a change in state or side effects on the server.
     */
    public static let post = HTTPMethod(name: "POST")

    /**
     The PUT method replaces all current representations of the target resource with the request payload.
     */
    public static let put = HTTPMethod(name: "PUT")

    /**
     The DELETE method deletes the specified resource.
     */
    public static let delete = HTTPMethod(name: "DELETE")

    /**
     The CONNECT method establishes a tunnel to the server identified by the target resource.
     */
    public static let connect = HTTPMethod(name: "CONNECT")

    /**
     The TRACE method performs a message loop-back test along the path to the target resource.
     */
    public static let trace = HTTPMethod(name: "TRACE")

    /**
     The OPTIONS method is used to describe the communication options for the target resource.
     */
    public static let options = HTTPMethod(name: "OPTIONS")

    /**
     The PATCH method is used to apply partial modifications to a resource.
     */
    public static let patch = HTTPMethod(name: "PATCH")

}
