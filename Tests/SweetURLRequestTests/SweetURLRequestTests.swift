import XCTest
@testable import SweetURLRequest

final class SweetURLRequestTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SweetURLRequest().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
