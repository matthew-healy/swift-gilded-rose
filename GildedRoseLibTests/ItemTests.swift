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
    
    func test_sellIn() {
        sut = .create(sellIn: 5)
        XCTAssertEqual(5, sut.sellIn)
    }
    
    func test_sellIn_isNotHardcoded() {
        sut = .create(sellIn: 10)
        XCTAssertEqual(10, sut.sellIn)
    }
    
    func test_quality() {
        sut = .create(quality: 1)
        XCTAssertEqual(1, sut.quality)
    }
    
    func test_quality_isNotHardcoded() {
        sut = .create(quality: 15)
        XCTAssertEqual(15, sut.quality)
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
