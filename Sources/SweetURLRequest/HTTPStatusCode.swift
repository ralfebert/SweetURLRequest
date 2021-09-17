import Foundation

/// This is a list of Hypertext Transfer Protocol (HTTP) response status codes.
/// It includes codes from IETF internet standards, other IETF RFCs, other specifications, and some additional commonly used codes.
/// The first digit of the status code specifies one of five classes of response; an HTTP client must recognise these five classes at a minimum.
/// - Author: Oliver Atkinson (https://gist.github.com/ollieatkinson/322338df8a5220d649ac01ff11e7de12)
public enum HTTPStatusCode: Error, Equatable, Hashable {

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
    case `continue`

    /// - The requester has asked the server to switch protocols and the server has agreed to do so.
    case switchingProtocols

    /// - This code indicates that the server has received and is processing the request, but no response is available yet.
    case processing

    //
    // Success - 2xx
    //

    /// - Standard response for successful HTTP requests.
    case ok

    /// - The request has been fulfilled, resulting in the creation of a new resource.
    case created

    /// - The request has been accepted for processing, but the processing has not been completed.
    case accepted

    /// - The server is a transforming proxy (e.g. a Web accelerator) that received a 200 OK from its origin, but is returning a modified version of the origin's response.
    case nonAuthoritativeInformation

    /// - The server successfully processed the request and is not returning any content.
    case noContent

    /// - The server successfully processed the request, but is not returning any content.
    case resetContent

    /// - The server is delivering only part of the resource (byte serving) due to a range header sent by the client.
    case partialContent

    /// - The message body that follows is an XML message and can contain a number of separate response codes, depending on how many sub-requests were made.
    case multiStatus

    /// - The members of a DAV binding have already been enumerated in a previous reply to this request, and are not being included again.
    case alreadyReported

    /// - The server has fulfilled a request for the resource, and the response is a representation of the result of one or more instance-manipulations applied to the current instance.
    case imUsed

    //
    // Redirection - 3xx
    //

    /// - Indicates multiple options for the resource from which the client may choose
    case multipleChoices

    /// - This and all future requests should be directed to the given URI.
    case movedPermanently

    /// - The resource was found.
    case found

    /// - The response to the request can be found under another URI using a GET method.
    case seeOther

    /// - Indicates that the resource has not been modified since the version specified by the request headers If-Modified-Since or If-None-Match.
    case notModified

    /// - The requested resource is available only through a proxy, the address for which is provided in the response.
    case useProxy

    /// - No longer used. Originally meant "Subsequent requests should use the specified proxy.
    case switchProxy

    /// - The request should be repeated with another URI.
    case temporaryRedirect

    /// - The request and all future requests should be repeated using another URI.
    case permenantRedirect

    //
    // Client Error - 4xx
    //

    /// - The server cannot or will not process the request due to an apparent client error.
    case badRequest

    /// - Similar to 403 Forbidden, but specifically for use when authentication is required and has failed or has not yet been provided.
    case unauthorized

    /// - The content available on the server requires payment.
    case paymentRequired

    /// - The request was a valid request, but the server is refusing to respond to it.
    case forbidden

    /// - The requested resource could not be found but may be available in the future.
    case notFound

    /// - A request method is not supported for the requested resource. e.g. a GET request on a form which requires data to be presented via POST
    case methodNotAllowed

    /// - The requested resource is capable of generating only content not acceptable according to the Accept headers sent in the request.
    case notAcceptable

    /// - The client must first authenticate itself with the proxy.
    case proxyAuthenticationRequired

    /// - The server timed out waiting for the request.
    case requestTimeout

    /// - Indicates that the request could not be processed because of conflict in the request, such as an edit conflict between multiple simultaneous updates.
    case conflict

    /// - Indicates that the resource requested is no longer available and will not be available again.
    case gone

    /// - The request did not specify the length of its content, which is required by the requested resource.
    case lengthRequired

    /// - The server does not meet one of the preconditions that the requester put on the request.
    case preconditionFailed

    /// - The request is larger than the server is willing or able to process.
    case payloadTooLarge

    /// - The URI provided was too long for the server to process.
    case uriTooLong

    /// - The request entity has a media type which the server or resource does not support.
    case unsupportedMediaType

    /// - The client has asked for a portion of the file (byte serving), but the server cannot supply that portion.
    case rangeNotSatisfiable

    /// - The server cannot meet the requirements of the Expect request-header field.
    case expectationFailed

    /// - This HTTP status is used as an Easter egg in some websites.
    case teapot

    /// - The request was directed at a server that is not able to produce a response.
    case misdirectedRequest

    /// - The request was well-formed but was unable to be followed due to semantic errors.
    case unprocessableEntity

    /// - The resource that is being accessed is locked.
    case locked

    /// - The request failed due to failure of a previous request (e.g., a PROPPATCH).
    case failedDependency

    /// - The client should switch to a different protocol such as TLS/1.0, given in the Upgrade header field.
    case upgradeRequired

    /// - The origin server requires the request to be conditional.
    case preconditionRequired

    /// - The user has sent too many requests in a given amount of time.
    case tooManyRequests

    /// - The server is unwilling to process the request because either an individual header field, or all the header fields collectively, are too large.
    case requestHeaderFieldsTooLarge

    /// - Used to indicate that the server has returned no information to the client and closed the connection.
    case noResponse

    /// - A server operator has received a legal demand to deny access to a resource or to a set of resources that includes the requested resource.
    case unavailableForLegalReasons

    /// - An expansion of the 400 Bad Request response code, used when the client has provided an invalid client certificate.
    case sslCertificateError

    /// - An expansion of the 400 Bad Request response code, used when a client certificate is required but not provided.
    case sslCertificateRequired

    /// - An expansion of the 400 Bad Request response code, used when the client has made a HTTP request to a port listening for HTTPS requests.
    case httpRequestSentToHTTPSPort

    /// - clientClosedRequest: Used when the client has closed the request before the server could send a response.
    case clientClosedRequest

    //
    // Server Error - 5xx
    //

    /// - A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.
    case internalServerError

    /// - The server either does not recognize the request method, or it lacks the ability to fulfill the request.
    case notImplemented

    /// - The server was acting as a gateway or proxy and received an invalid response from the upstream server.
    case badGateway

    /// - The server is currently unavailable (because it is overloaded or down for maintenance). Generally, this is a temporary state.
    case serviceUnavailable

    /// - The server was acting as a gateway or proxy and did not receive a timely response from the upstream server.
    case gatewayTimeout

    /// - The server does not support the HTTP protocol version used in the request.
    case httpVersionNotSupported

    /// - Transparent content negotiation for the request results in a circular reference.
    case variantAlsoNegotiates

    /// - The server is unable to store the representation needed to complete the request.
    case insufficientStorage

    /// - The server detected an infinite loop while processing the request.
    case loopDetected

    /// - Further extensions to the request are required for the server to fulfill it.
    case notExtended

    /// - The client needs to authenticate to gain network access.
    case networkAuthenticationRequired

    //
    // Undefined
    //

    case other(Int)

    /// Mappings

    public init(_ rawValue: Int) {
        self = Self.reverseMapping[rawValue] ?? Self.other(rawValue)
    }

    public var rawValue: Int {
        switch self {
            case let .other(code):
                return code
            default:
                return Self.mapping[self]!
        }
    }

    /// The class (or group) which the status code belongs to.
    public var responseType: ResponseType {
        ResponseType(httpStatusCode: self.rawValue)
    }

    private static let mapping: [HTTPStatusCode: Int] = [
        .continue: 100,
        .switchingProtocols: 101,
        .processing: 102,

        .ok: 200,
        .created: 201,
        .accepted: 202,
        .nonAuthoritativeInformation: 203,
        .noContent: 204,
        .resetContent: 205,
        .partialContent: 206,
        .multiStatus: 207,
        .alreadyReported: 208,
        .imUsed: 226,

        .multipleChoices: 300,
        .movedPermanently: 301,
        .found: 302,
        .seeOther: 303,
        .notModified: 304,
        .useProxy: 305,
        .switchProxy: 306,
        .temporaryRedirect: 307,
        .permenantRedirect: 308,

        .badRequest: 400,
        .unauthorized: 401,
        .paymentRequired: 402,
        .forbidden: 403,
        .notFound: 404,
        .methodNotAllowed: 405,
        .notAcceptable: 406,
        .proxyAuthenticationRequired: 407,
        .requestTimeout: 408,
        .conflict: 409,
        .gone: 410,
        .lengthRequired: 411,
        .preconditionFailed: 412,
        .payloadTooLarge: 413,
        .uriTooLong: 414,
        .unsupportedMediaType: 415,
        .rangeNotSatisfiable: 416,
        .expectationFailed: 417,
        .teapot: 418,
        .misdirectedRequest: 421,
        .unprocessableEntity: 422,
        .locked: 423,
        .failedDependency: 424,
        .upgradeRequired: 426,
        .preconditionRequired: 428,
        .tooManyRequests: 429,
        .requestHeaderFieldsTooLarge: 431,
        .noResponse: 444,
        .unavailableForLegalReasons: 451,
        .sslCertificateError: 495,
        .sslCertificateRequired: 496,
        .httpRequestSentToHTTPSPort: 497,
        .clientClosedRequest: 499,

        .internalServerError: 500,
        .notImplemented: 501,
        .badGateway: 502,
        .serviceUnavailable: 503,
        .gatewayTimeout: 504,
        .httpVersionNotSupported: 505,
        .variantAlsoNegotiates: 506,
        .insufficientStorage: 507,
        .loopDetected: 508,
        .notExtended: 510,
        .networkAuthenticationRequired: 511,
    ]

    private static let reverseMapping: [Int: HTTPStatusCode] = {
        Dictionary(uniqueKeysWithValues: Self.mapping.map { key, value in
            (value, key)
        })
    }()

}
