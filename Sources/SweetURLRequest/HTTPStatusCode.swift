import Foundation

/// This is a list of Hypertext Transfer Protocol (HTTP) response status codes.
/// It includes codes from IETF internet standards, other IETF RFCs, other specifications, and some additional commonly used codes.
/// The first digit of the status code specifies one of five classes of response; an HTTP client must recognise these five classes at a minimum.
/// - Author: Oliver Atkinson (https://gist.github.com/ollieatkinson/322338df8a5220d649ac01ff11e7de12)
public enum HTTPStatusCode: Int, Error {

    /// The response class representation of status codes, these get grouped by their first digit.
    public enum ResponseType {

        /// - Indicates a provisional response, consisting only of the Status-Line and optional headers, and is terminated by an empty line.
        case informational

        /// - Indicates the action requested by the client was received, understood, accepted, and processed successfully.
        case success

        /// - Indicates the client must take additional action to complete the request.
        case redirection

        /// - Intended for situations in which the client seems to have erred.
        case clientError

        /// - Indicates the server failed to fulfill an apparently valid request.
        case serverError

        /// - Class of the status code cannot be resolved.
        case undefined

        /// ResponseType by HTTP status code
        public init(httpStatusCode: Int) {
            switch httpStatusCode {

                case 100 ..< 200:
                    self = .informational

                case 200 ..< 300:
                    self = .success

                case 300 ..< 400:
                    self = .redirection

                case 400 ..< 500:
                    self = .clientError

                case 500 ..< 600:
                    self = .serverError

                default:
                    self = .undefined

            }

        }
    }

    //
    // Informational - 1xx
    //

    /// - The server has received the request headers and the client should proceed to send the request body.
    case `continue` = 100

    /// - The requester has asked the server to switch protocols and the server has agreed to do so.
    case switchingProtocols = 101

    /// - This code indicates that the server has received and is processing the request, but no response is available yet.
    case processing = 102

    //
    // Success - 2xx
    //

    /// - Standard response for successful HTTP requests.
    case ok = 200

    /// - The request has been fulfilled, resulting in the creation of a new resource.
    case created = 201

    /// - The request has been accepted for processing, but the processing has not been completed.
    case accepted = 202

    /// - The server is a transforming proxy (e.g. a Web accelerator) that received a 200 OK from its origin, but is returning a modified version of the origin's response.
    case nonAuthoritativeInformation = 203

    /// - The server successfully processed the request and is not returning any content.
    case noContent = 204

    /// - The server successfully processed the request, but is not returning any content.
    case resetContent = 205

    /// - The server is delivering only part of the resource (byte serving) due to a range header sent by the client.
    case partialContent = 206

    /// - The message body that follows is an XML message and can contain a number of separate response codes, depending on how many sub-requests were made.
    case multiStatus = 207

    /// - The members of a DAV binding have already been enumerated in a previous reply to this request, and are not being included again.
    case alreadyReported = 208

    /// - The server has fulfilled a request for the resource, and the response is a representation of the result of one or more instance-manipulations applied to the current instance.
    case imUsed = 226

    //
    // Redirection - 3xx
    //

    /// - Indicates multiple options for the resource from which the client may choose
    case multipleChoices = 300

    /// - This and all future requests should be directed to the given URI.
    case movedPermanently = 301

    /// - The resource was found.
    case found = 302

    /// - The response to the request can be found under another URI using a GET method.
    case seeOther = 303

    /// - Indicates that the resource has not been modified since the version specified by the request headers If-Modified-Since or If-None-Match.
    case notModified = 304

    /// - The requested resource is available only through a proxy, the address for which is provided in the response.
    case useProxy = 305

    /// - No longer used. Originally meant "Subsequent requests should use the specified proxy.
    case switchProxy = 306

    /// - The request should be repeated with another URI.
    case temporaryRedirect = 307

    /// - The request and all future requests should be repeated using another URI.
    case permenantRedirect = 308

    //
    // Client Error - 4xx
    //

    /// - The server cannot or will not process the request due to an apparent client error.
    case badRequest = 400

    /// - Similar to 403 Forbidden, but specifically for use when authentication is required and has failed or has not yet been provided.
    case unauthorized = 401

    /// - The content available on the server requires payment.
    case paymentRequired = 402

    /// - The request was a valid request, but the server is refusing to respond to it.
    case forbidden = 403

    /// - The requested resource could not be found but may be available in the future.
    case notFound = 404

    /// - A request method is not supported for the requested resource. e.g. a GET request on a form which requires data to be presented via POST
    case methodNotAllowed = 405

    /// - The requested resource is capable of generating only content not acceptable according to the Accept headers sent in the request.
    case notAcceptable = 406

    /// - The client must first authenticate itself with the proxy.
    case proxyAuthenticationRequired = 407

    /// - The server timed out waiting for the request.
    case requestTimeout = 408

    /// - Indicates that the request could not be processed because of conflict in the request, such as an edit conflict between multiple simultaneous updates.
    case conflict = 409

    /// - Indicates that the resource requested is no longer available and will not be available again.
    case gone = 410

    /// - The request did not specify the length of its content, which is required by the requested resource.
    case lengthRequired = 411

    /// - The server does not meet one of the preconditions that the requester put on the request.
    case preconditionFailed = 412

    /// - The request is larger than the server is willing or able to process.
    case payloadTooLarge = 413

    /// - The URI provided was too long for the server to process.
    case uriTooLong = 414

    /// - The request entity has a media type which the server or resource does not support.
    case unsupportedMediaType = 415

    /// - The client has asked for a portion of the file (byte serving), but the server cannot supply that portion.
    case rangeNotSatisfiable = 416

    /// - The server cannot meet the requirements of the Expect request-header field.
    case expectationFailed = 417

    /// - This HTTP status is used as an Easter egg in some websites.
    case teapot = 418

    /// - The request was directed at a server that is not able to produce a response.
    case misdirectedRequest = 421

    /// - The request was well-formed but was unable to be followed due to semantic errors.
    case unprocessableEntity = 422

    /// - The resource that is being accessed is locked.
    case locked = 423

    /// - The request failed due to failure of a previous request (e.g., a PROPPATCH).
    case failedDependency = 424

    /// - The client should switch to a different protocol such as TLS/1.0, given in the Upgrade header field.
    case upgradeRequired = 426

    /// - The origin server requires the request to be conditional.
    case preconditionRequired = 428

    /// - The user has sent too many requests in a given amount of time.
    case tooManyRequests = 429

    /// - The server is unwilling to process the request because either an individual header field, or all the header fields collectively, are too large.
    case requestHeaderFieldsTooLarge = 431

    /// - Used to indicate that the server has returned no information to the client and closed the connection.
    case noResponse = 444

    /// - A server operator has received a legal demand to deny access to a resource or to a set of resources that includes the requested resource.
    case unavailableForLegalReasons = 451

    /// - An expansion of the 400 Bad Request response code, used when the client has provided an invalid client certificate.
    case sslCertificateError = 495

    /// - An expansion of the 400 Bad Request response code, used when a client certificate is required but not provided.
    case sslCertificateRequired = 496

    /// - An expansion of the 400 Bad Request response code, used when the client has made a HTTP request to a port listening for HTTPS requests.
    case httpRequestSentToHTTPSPort = 497

    /// - clientClosedRequest: Used when the client has closed the request before the server could send a response.
    case clientClosedRequest = 499

    //
    // Server Error - 5xx
    //

    /// - A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.
    case internalServerError = 500

    /// - The server either does not recognize the request method, or it lacks the ability to fulfill the request.
    case notImplemented = 501

    /// - The server was acting as a gateway or proxy and received an invalid response from the upstream server.
    case badGateway = 502

    /// - The server is currently unavailable (because it is overloaded or down for maintenance). Generally, this is a temporary state.
    case serviceUnavailable = 503

    /// - The server was acting as a gateway or proxy and did not receive a timely response from the upstream server.
    case gatewayTimeout = 504

    /// - The server does not support the HTTP protocol version used in the request.
    case HTTPVersionNotSupported = 505

    /// - Transparent content negotiation for the request results in a circular reference.
    case variantAlsoNegotiates = 506

    /// - The server is unable to store the representation needed to complete the request.
    case insufficientStorage = 507

    /// - The server detected an infinite loop while processing the request.
    case loopDetected = 508

    /// - Further extensions to the request are required for the server to fulfill it.
    case notExtended = 510

    /// - The client needs to authenticate to gain network access.
    case networkAuthenticationRequired = 511

    /// The class (or group) which the status code belongs to.
    public var responseType: ResponseType {
        ResponseType(httpStatusCode: self.rawValue)
    }

}

extension HTTPURLResponse {

    var status: HTTPStatusCode? {
        return HTTPStatusCode(rawValue: statusCode)
    }

}
