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

import SweetURLRequest
import XCTest

struct Person: Codable {
    var name: String
}

final class SweetURLRequestTests: XCTestCase {

    func testMethod() {
        let request = URLRequest(method: .post, url: URL(string: "http://www.example.com")!)
        XCTAssertEqual("POST", request.httpMethod)
    }

    func testHeaderSubscript() {
        var request = URLRequest(url: URL(string: "http://www.example.com")!)
        request.headers.accept = .xml
        request.headers.accept = .json
        XCTAssertEqual(["Accept": "application/json"], request.allHTTPHeaderFields)
        XCTAssertEqual(.json, request.headers.accept)
        request.headers.accept = nil
        XCTAssertEqual([:], request.allHTTPHeaderFields)
    }

    func testHeaders() {
        var request = URLRequest(url: URL(string: "http://www.example.com")!)
        request.headers.accept = .json
        request.headers.contentType = .xml
        request.headers.authorization = "Bearer xyz"
        XCTAssertEqual(["Content-Type": "application/xml", "Authorization": "Bearer xyz", "Accept": "application/json"], request.allHTTPHeaderFields)
        XCTAssertEqual(.json, request.headers.accept)
        XCTAssertEqual(.xml, request.headers.contentType)
        XCTAssertEqual("Bearer xyz", request.headers.authorization)
    }

    func testGetParameters() {
        let request = URLRequest(method: .get, url: URL(string: "http://www.example.com")!, parameters: ["param1": "äöü", "param2": "foo bar"])
        XCTAssertEqual("http://www.example.com?param1=%C3%A4%C3%B6%C3%BC&param2=foo%20bar", request.url?.absoluteString)
    }

    func testPostParameters() {
        let request = URLRequest(method: .post, url: URL(string: "http://www.example.com")!, parameters: ["param1": "äöü", "param2": nil, "param3": "foo bar"])
        XCTAssertEqual("http://www.example.com", request.url?.absoluteString)
        XCTAssertEqual("param1=%C3%A4%C3%B6%C3%BC&param2&param3=foo%20bar", String(data: request.httpBody ?? Data(), encoding: .ascii))
        XCTAssertEqual(.formUrlEncoded, request.headers.contentType)
    }

    func testJsonBody() {
        let request = URLRequest(method: .post, url: URL(string: "http://www.example.com")!, jsonBody: Person(name: "Bob"))
        XCTAssertEqual("{\"name\":\"Bob\"}", String(data: request.httpBody ?? Data(), encoding: .ascii))
        XCTAssertEqual(.json, request.headers.contentType)
    }

}
