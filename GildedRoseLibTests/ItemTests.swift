import XCTest
@testable import GildedRoseLib

class ItemTests: XCTestCase {
    
    func test_name() {
        let sut = Item(name: "Forbs")
        XCTAssertEqual("Forbs", sut.name)
    }

    func test_name_notHardcoded() {
        let sut = Item(name: "What")
        XCTAssertEqual("What", sut.name)
    }

}
