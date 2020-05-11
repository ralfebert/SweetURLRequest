// MIT License
//
// Copyright (c) 2020 Ralf Ebert
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

private enum HTTPHeader: String {
    case accept = "Accept"
    case contentType = "Content-Type"
}

public struct HTTPHeaders {

    var dictionary: [String: String]

    /**
     The [Accept request HTTP header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept) advertises which content types the client is able to understand.
     */
    public var accept: ContentType? {
        get {
            if let value = dictionary[HTTPHeader.accept.rawValue] {
                return ContentType(rawValue: value)
            } else {
                return nil
            }
        }
        set {
            self.dictionary[HTTPHeader.accept.rawValue] = newValue?.rawValue
        }
    }

    /**
     In requests, (such as POST or PUT), the [Content-Type header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type) tells the server what type of data is sent in the body.
     */
    public var contentType: ContentType? {
        get {
            if let value = dictionary[HTTPHeader.contentType.rawValue] {
                return ContentType(rawValue: value)
            } else {
                return nil
            }
        }
        set {
            self.dictionary[HTTPHeader.contentType.rawValue] = newValue?.rawValue
        }
    }

}
