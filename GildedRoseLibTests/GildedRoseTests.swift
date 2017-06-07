import XCTest
@testable import GildedRoseLib

class GildedRoseTests: XCTestCase {

    func test_updateQuality_doesNotChangeName() {
        let items: [Item] = [.create(name: "abc")]
        let sut = GildedRose(items: items)
        sut.updateQuality()
        XCTAssertEqual("abc", sut.items[0].name)
    }
    
    func test_updateQuality_regularItem_reducesSellInBy1() {
        let items: [Item] = [.create(sellIn: 5)]
        let sut = GildedRose(items: items)
        sut.updateQuality()
        XCTAssertEqual(4, sut.items[0].sellIn)
    }
    
    func test_updateQuality_inDateItem_reducesQualityBy1() {
        let items: [Item] = [.create(sellIn: 2, quality: 2)]
        let sut = GildedRose(items: items)
        sut.updateQuality()
        XCTAssertEqual(1, sut.items[0].quality)
    }
    
    func test_updateQuality_outOfDateItem_reducesQualityBy2() {
        let items: [Item] = [.create(sellIn: -1, quality: 2)]
        let sut = GildedRose(items: items)
        sut.updateQuality()
        XCTAssertEqual(0, sut.items[0].quality)
    }

}
