import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SweetURLRequestTests.allTests),
    ]
}
#endif
