// MIT License
//
// Copyright (c) 2021 Ralf Ebert
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

public struct HTTPHeaders {

    var dictionary: [String: String]

    private subscript(header: HTTPHeader) -> String? {
        get {
            if let value = dictionary[header.name] {
                return value
            } else {
                return nil
            }
        }
        set {
            self.dictionary[header.name] = newValue
        }
    }

    /**
     The [Accept request HTTP header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept) advertises which content types the client is able to understand.
     */
    public var accept: ContentType? {
        get {
            if let value = self[HTTPHeader.accept] {
                return ContentType(value)
            } else {
                return nil
            }
        }
        set {
            self[HTTPHeader.accept] = newValue?.name
        }
    }

    /**
     In requests, (such as POST or PUT), the [Content-Type header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type) tells the server what type of data is sent in the body.
     */
    public var contentType: ContentType? {
        get {
            if let value = self[HTTPHeader.contentType] {
                return ContentType(value)
            } else {
                return nil
            }
        }
        set {
            self[HTTPHeader.contentType] = newValue?.name
        }
    }

    /**
     The [HTTP Authorization request header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Authorization) contains the credentials to authenticate a user agent with a server.
     */
    public var authorization: String? {
        get {
            self[HTTPHeader.authorization]
        }
        set {
            self[HTTPHeader.authorization] = newValue
        }
    }

}
