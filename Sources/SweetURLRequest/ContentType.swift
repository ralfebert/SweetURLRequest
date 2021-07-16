/**
 Common MIME types
 Generated from https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types
 */
public struct ContentType: Equatable, Hashable {

    public let name: String

    public init(_ name: String) {
        self.name = name
    }

    /// AAC audio
    public static let aac = Self("audio/aac")

    /// AVI: Audio Video Interleave
    public static let avi = Self("video/x-msvideo")

    /// Any kind of binary data
    public static let octetStream = Self("application/octet-stream")

    /// Bitmap Graphics
    public static let bmp = Self("image/bmp")

    /// BZip archive
    public static let bzip = Self("application/x-bzip")

    /// BZip2 archive
    public static let bzip2 = Self("application/x-bzip2")

    /// Cascading Style Sheets (CSS)
    public static let css = Self("text/css")

    /// Comma-separated values (CSV)
    public static let csv = Self("text/csv")

    /// Microsoft Word
    public static let word = Self("application/msword")

    /// Electronic publication (EPUB)
    public static let epub = Self("application/epub+zip")

    /// GZip Compressed Archive
    public static let gzip = Self("application/gzip")

    /// Graphics Interchange Format (GIF)
    public static let gif = Self("image/gif")

    /// HyperText Markup Language (HTML)
    public static let html = Self("text/html")

    /// iCalendar format
    public static let iCal = Self("text/calendar")

    /// JPEG images
    public static let jpeg = Self("image/jpeg")

    /// JavaScript
    public static let javascript = Self("text/javascript")

    /// JSON format
    public static let json = Self("application/json")

    /// Musical Instrument Digital Interface (MIDI)
    public static let midi = Self("audio/midi")

    /// MP3 audio
    public static let mpegAudio = Self("audio/mpeg")

    /// MPEG Video
    public static let mpegVideo = Self("video/mpeg")

    /// OGG audio
    public static let oggAudio = Self("audio/ogg")

    /// OGG video
    public static let oggVideo = Self("video/ogg")

    /// OGG
    public static let ogg = Self("application/ogg")

    /// Opus audio
    public static let opusAudio = Self("audio/opus")

    /// OpenType font
    public static let openType = Self("font/otf")

    /// Portable Network Graphics
    public static let png = Self("image/png")

    /// Adobe Portable Document Format (PDF)
    public static let pdf = Self("application/pdf")

    /// Rich Text Format (RTF)
    public static let rtf = Self("application/rtf")

    /// Scalable Vector Graphics (SVG)
    public static let svg = Self("image/svg+xml")

    /// Small web format (SWF) or Adobe Flash document
    public static let swf = Self("application/x-shockwave-flash")

    /// Tape Archive (TAR)
    public static let tar = Self("application/x-tar")

    /// Tagged Image File Format (TIFF)
    public static let tiff = Self("image/tiff")

    /// MPEG transport stream
    public static let mpegStream = Self("video/mp2t")

    /// TrueType Font
    public static let ttf = Self("font/ttf")

    /// Text
    public static let text = Self("text/plain")

    /// Waveform Audio Format
    public static let wav = Self("audio/wav")

    /// WEBM audio
    public static let webmAudio = Self("audio/webm")

    /// WEBM video
    public static let webmVideo = Self("video/webm")

    /// WEBP image
    public static let webp = Self("image/webp")

    /// Web Open Font Format (WOFF)
    public static let woff = Self("font/woff")

    /// Web Open Font Format (WOFF)
    public static let woff2 = Self("font/woff2")

    /// XHTML
    public static let xhtml = Self("application/xhtml+xml")

    /// XML
    public static let xml = Self("application/xml")

    /// XML
    public static let xmlText = Self("text/xml")

    /// ZIP archive
    public static let zip = Self("application/zip")

    // HTTP form: keys and values URL-encoded in key-value tuples separated by '&'
    public static let formUrlEncoded = Self("application/x-www-form-urlencoded")

    // HTTP form: each value is sent as a block of data
    public static let formDataMultipart = Self("multipart/form-data")

}
