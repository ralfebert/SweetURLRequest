/**
 HTTP header fields
 Generated from: https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#Standard_request_fields
 */
public struct HTTPHeader: Equatable, Hashable {

    public let name: String

    public init(_ name: String) {
        self.name = name
    }

    /// Acceptable instance-manipulations for the request.
    /// For example: `A-IM: feed`
    public static let aim = Self("A-IM")

    /// Media type(s) that is/are acceptable for the response. See Content negotiation.
    /// For example: `Accept: text/html`
    public static let accept = Self("Accept")

    /// Character sets that are acceptable.
    /// For example: `Accept-Charset: utf-8`
    public static let acceptCharset = Self("Accept-Charset")

    /// Acceptable version in time.
    /// For example: `Accept-Datetime: Thu, 31 May 2007 20:35:00 GMT`
    public static let acceptDatetime = Self("Accept-Datetime")

    /// List of acceptable encodings. See HTTP compression.
    /// For example: `Accept-Encoding: gzip, deflate`
    public static let acceptEncoding = Self("Accept-Encoding")

    /// List of acceptable human languages for response. See Content negotiation.
    /// For example: `Accept-Language: en-US`
    public static let acceptLanguage = Self("Accept-Language")

    /// Initiates a request for cross-origin resource sharing with Origin (below).
    /// For example: `Access-Control-Request-Method: GET`
    public static let accessControlRequestMethod = Self("Access-Control-Request-Method")
    public static let accessControlRequestHeaders = Self("Access-Control-Request-Headers")

    /// Authentication credentials for HTTP authentication.
    /// For example: `Authorization: Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==`
    public static let authorization = Self("Authorization")

    /// Used to specify directives that must be obeyed by all caching mechanisms along the request-response chain.
    /// For example: `Cache-Control: no-cache`
    public static let cacheControl = Self("Cache-Control")

    /// Control options for the current connection and list of hop-by-hop request fields. Must not be used with HTTP/2.
    /// For example: `Connection: keep-alive Connection: Upgrade`
    public static let connection = Self("Connection")

    /// The type of encoding used on the data. See HTTP compression.
    /// For example: `Content-Encoding: gzip`
    public static let contentEncoding = Self("Content-Encoding")

    /// The length of the request body in octets (8-bit bytes).
    /// For example: `Content-Length: 348`
    public static let contentLength = Self("Content-Length")

    /// A Base64-encoded binary MD5 sum of the content of the request body.
    /// For example: `Content-MD5: Q2hlY2sgSW50ZWdyaXR5IQ==`
    public static let contentMD5 = Self("Content-MD5")

    /// The Media type of the body of the request (used with POST and PUT requests).
    /// For example: `Content-Type: application/x-www-form-urlencoded`
    public static let contentType = Self("Content-Type")

    /// An HTTP cookie previously sent by the server with Set-Cookie (below).
    /// For example: `Cookie: $Version=1; Skin=new;`
    public static let cookie = Self("Cookie")

    /// The date and time at which the message was originated (in "HTTP-date" format as defined by RFC 7231 Date/Time Formats).
    /// For example: `Date: Tue, 15 Nov 1994 08:12:31 GMT`
    public static let date = Self("Date")

    /// Indicates that particular server behaviors are required by the client.
    /// For example: `Expect: 100-continue`
    public static let expect = Self("Expect")

    /// Disclose original information of a client connecting to a web server through an HTTP proxy.
    /// For example: `Forwarded: for=192.0.2.60;proto=http;by=203.0.113.43 Forwarded: for=192.0.2.43, for=198.51.100.17`
    public static let forwarded = Self("Forwarded")

    /// The email address of the user making the request.
    /// For example: `From: user@example.com`
    public static let from = Self("From")

    /// The domain name of the server (for virtual hosting), and the TCP port number on which the server is listening. The port number may be omitted if the port is the standard port for the service requested. Mandatory since HTTP/1.1. If the request is generated directly in HTTP/2, it should not be used.
    /// For example: `Host: en.wikipedia.org:8080 Host: en.wikipedia.org`
    public static let host = Self("Host")

    /// A request that upgrades from HTTP/1.1 to HTTP/2 MUST include exactly one HTTP2-Setting header field. The HTTP2-Settings header field is a connection-specific header field that includes parameters that govern the HTTP/2 connection, provided in anticipation of the server accepting the request to upgrade.
    /// For example: `HTTP2-Settings: token64`
    public static let http2Settings = Self("HTTP2-Settings")

    /// Only perform the action if the client supplied entity matches the same entity on the server. This is mainly for methods like PUT to only update a resource if it has not been modified since the user last updated it.
    /// For example: `If-Match: "737060cd8c284d8af7ad3082f209582d"`
    public static let ifMatch = Self("If-Match")

    /// Allows a 304 Not Modified to be returned if content is unchanged.
    /// For example: `If-Modified-Since: Sat, 29 Oct 1994 19:43:31 GMT`
    public static let ifModifiedSince = Self("If-Modified-Since")

    /// Allows a 304 Not Modified to be returned if content is unchanged, see HTTP ETag.
    /// For example: `If-None-Match: "737060cd8c284d8af7ad3082f209582d"`
    public static let ifNoneMatch = Self("If-None-Match")

    /// If the entity is unchanged, send me the part(s) that I am missing; otherwise, send me the entire new entity.
    /// For example: `If-Range: "737060cd8c284d8af7ad3082f209582d"`
    public static let ifRange = Self("If-Range")

    /// Only send the response if the entity has not been modified since a specific time.
    /// For example: `If-Unmodified-Since: Sat, 29 Oct 1994 19:43:31 GMT`
    public static let ifUnmodifiedSince = Self("If-Unmodified-Since")

    /// Limit the number of times the message can be forwarded through proxies or gateways.
    /// For example: `Max-Forwards: 10`
    public static let maxForwards = Self("Max-Forwards")

    /// Initiates a request for cross-origin resource sharing (asks server for Access-Control-* response fields).
    /// For example: `Origin: http://www.example-social-network.com`
    public static let origin = Self("Origin")

    /// Implementation-specific fields that may have various effects anywhere along the request-response chain.
    /// For example: `Pragma: no-cache`
    public static let pragma = Self("Pragma")

    /// Authorization credentials for connecting to a proxy.
    /// For example: `Proxy-Authorization: Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==`
    public static let proxyAuthorization = Self("Proxy-Authorization")

    /// Request only part of an entity.  Bytes are numbered from 0.  See Byte serving.
    /// For example: `Range: bytes=500-999`
    public static let range = Self("Range")

    /// This is the address of the previous web page from which a link to the currently requested page was followed. (The word "referrer" has been misspelled in the RFC as well as in most implementations to the point that it has become standard usage and is considered correct terminology)
    /// For example: `Referer: http://en.wikipedia.org/wiki/Main_Page`
    public static let referer = Self("Referer")

    /// The transfer encodings the user agent is willing to accept: the same values as for the response header field Transfer-Encoding can be used, plus the "trailers" value (related to the "chunked" transfer method) to notify the server it expects to receive additional fields in the trailer after the last, zero-sized, chunk. Only trailers is supported in HTTP/2.
    /// For example: `TE: trailers, deflate`
    public static let te = Self("TE")

    /// The Trailer general field value indicates that the given set of header fields is present in the trailer of a message encoded with chunked transfer coding.
    /// For example: `Trailer: Max-Forwards`
    public static let trailer = Self("Trailer")

    /// The form of encoding used to safely transfer the entity to the user. Currently defined methods are: chunked, compress, deflate, gzip, identity. Must not be used with HTTP/2.
    /// For example: `Transfer-Encoding: chunked`
    public static let transferEncoding = Self("Transfer-Encoding")

    /// The user agent string of the user agent.
    /// For example: `User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:12.0) Gecko/20100101 Firefox/12.0`
    public static let userAgent = Self("User-Agent")

    /// Ask the server to upgrade to another protocol. Must not be used in HTTP/2.
    /// For example: `Upgrade: h2c, HTTPS/1.3, IRC/6.9, RTA/x11, websocket`
    public static let upgrade = Self("Upgrade")

    /// Informs the server of proxies through which the request was sent.
    /// For example: `Via: 1.0 fred, 1.1 example.com (Apache/1.1)`
    public static let via = Self("Via")

    /// A general warning about possible problems with the entity body.
    /// For example: `Warning: 199 Miscellaneous warning`
    public static let warning = Self("Warning")
}
