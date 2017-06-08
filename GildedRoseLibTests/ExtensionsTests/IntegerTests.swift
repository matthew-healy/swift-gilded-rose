import XCTest
@testable import GildedRoseLib

class IntegerTests: XCTestCase {
    
    func test_1_clampedTo_withinRange_returns1() {
        XCTAssertEqual(1, 1.clamped(to: 0...2))
    }

    func test_5_clampedTo_withinRange_returns5() {
        XCTAssertEqual(5, 5.clamped(to: 0...10))
    }

    func test_10_clampedTo_0to9_returns9() {
        XCTAssertEqual(9, 10.clamped(to: 0...9))
    }
    
    func test_100_clampedTo_0to51_returns51() {
        XCTAssertEqual(51, 100.clamped(to: 0...51))
    }
    
    func test_minus5_clampedTo_minus1to3_returnsMinus1() {
        XCTAssertEqual(-1, (-5).clamped(to: -1...3))
    }
    
    func test_1_clampedTo_4to17_returns4() {
        XCTAssertEqual(4, 1.clamped(to: 4...17))
    }
    
}
