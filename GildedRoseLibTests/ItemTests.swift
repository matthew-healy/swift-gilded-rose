import XCTest
@testable import GildedRoseLib

class ItemTests: XCTestCase {
    
    var sut: Item!
    
    func test_name() {
        sut = .create(name: "abc")
        XCTAssertEqual("abc", sut.name)
    }
    
    func test_name_isNotHardcoded() {
        sut = .create(name: "defg")
        XCTAssertEqual("defg", sut.name)
    }
    
}

private extension Item {
    static func create(
        name: String = "",
        sellIn: Int = 0,
        quality: Int = 0
    ) -> Item {
        return Item(
            name: name,
            sellIn: sellIn,
            quality: quality
        )
    }
}
