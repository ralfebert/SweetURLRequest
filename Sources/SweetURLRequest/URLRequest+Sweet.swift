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

import Foundation
@_exported import HttpEnums

public extension URLRequest {

    /**
     Convenience method to create an URLRequest:

     - Parameters:
       - method: The HTTP method to use
       - url: The URL to use
       - parameters: Parameters will be URL-encoded for GET/HEAD/DELETE and sent as application/x-www-form-urlencoded body for other methods by default.
     */
    init(method: HTTPMethod, url: URL, parameters: [String: String] = [:]) {
        self.init(url: url)
        self.httpMethod = method.rawValue

        if !parameters.isEmpty {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
            components.queryItems = (components.queryItems ?? []) + parameters.map(URLQueryItem.init(name:value:)).sorted(by: { $0.name < $1.name })
            let urlParams = [.get, .head, .delete].contains(method)
            if urlParams {
                self.url = components.url!
            } else {
                self.httpBody = components.url!.query!.data(using: .utf8)!
                self.headers.contentType = .formUrlEncoded
            }
        }
    }

    init<T: Encodable>(method: HTTPMethod, url: URL, parameters: [String: String] = [:], jsonBody: T, encoder: JSONEncoder = JSONEncoder()) {
        self.init(method: method, url: url, parameters: parameters)
        self.headers.contentType = .json
        self.httpBody = try! encoder.encode(jsonBody)
    }

    var headers: HTTPHeaders {
        get {
            HTTPHeaders(dictionary: self.allHTTPHeaderFields ?? [:])
        }
        set {
            let newValueDict = newValue.dictionary
            self.allHTTPHeaderFields = newValueDict
            // URLSession.allHTTPHeaderFields only adds keys, but removal needs to be done manually
            if let existingFields = self.allHTTPHeaderFields?.keys {
                for field in existingFields {
                    if !newValueDict.keys.contains(field) {
                        self.setValue(nil, forHTTPHeaderField: field)
                    }
                }
            }
        }
    }

}
