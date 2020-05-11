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

/**
 Enum to represent a HTTP request method.
 
 See also [HTTP request methods](https://developer.mozilla.org/de/docs/Web/HTTP/Methods)
 */
public enum HTTPMethod: String {

    /** The GET method requests a representation of the specified resource. Requests using GET should only retrieve data. */
    case get = "GET"

    /**
     The HEAD method asks for a response identical to that of a GET request, but without the response body.
     */
    case head = "HEAD"

    /**
     The POST method is used to submit an entity to the specified resource, often causing a change in state or side effects on the server.
     */
    case post = "POST"

    /**
     The PUT method replaces all current representations of the target resource with the request payload.
     */
    case put = "PUT"

    /**
     The DELETE method deletes the specified resource.
     */
    case delete = "DELETE"

    /**
     The CONNECT method establishes a tunnel to the server identified by the target resource.
     */
    case connect = "CONNECT"

    /**
     The TRACE method performs a message loop-back test along the path to the target resource.
     */
    case trace = "TRACE"

    /**
     The OPTIONS method is used to describe the communication options for the target resource.
     */
    case options = "OPTIONS"

    /**
     The PATCH method is used to apply partial modifications to a resource.
     */
    case patch = "PATCH"

}
