import XCTest
import MultiplicativeArithmetic



final class MultiplicativeArithmeticTests: XCTestCase {
    
    func testSugar() {
        XCTAssertEqual(sqrt(7.5), 7.5.sqrt())
        XCTAssertEqual(Foundation.sqrt(7.5), sqrt<Double>(7.5))
    }
    
    
    static var allTests = [
        ("testSugar", testSugar),
    ]
}
