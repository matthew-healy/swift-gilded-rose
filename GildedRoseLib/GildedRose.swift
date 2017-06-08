private let sulfurasName = "Sulfuras, Hand of Ragnaros"
private let passesName = "Backstage passes to a TAFKAL80ETC concert"
private let brieName = "Aged Brie"


public class GildedRose {
    var items:[Item]
    
    required public init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for i in 0..<items.count {
            if (items[i].name != brieName && items[i].name != passesName) {
                if (items[i].quality > 0) {
                    if !items[i].isLegendary {
                        items[i].quality -= 1
                    }
                }
            } else {
                if (items[i].quality < 50) {
                    items[i].quality += 1
                    
                    if (items[i].name == passesName) {
                        if (items[i].sellIn < 11) {
                            if (items[i].quality < 50) {
                                items[i].quality += 1
                            }
                        }
                        
                        if (items[i].sellIn < 6) {
                            if (items[i].quality < 50) {
                                items[i].quality += 1
                            }
                        }
                    }
                }
            }
            
            decreaseSellInForNonLegendaryItem(atIndex: i)
            
            if (items[i].sellIn < 0) {
                if (items[i].name != brieName) {
                    if (items[i].name != passesName) {
                        if (items[i].quality > 0) {
                            if !items[i].isLegendary {
                                items[i].quality -= 1
                            }
                        }
                    } else {
                        items[i].quality = 0
                    }
                } else {
                    if (items[i].quality < 50) {
                        items[i].quality += 1
                    }
                }
            }
        }
    }
    
    private func decreaseSellInForNonLegendaryItem(atIndex i: Int) {
        if !items[i].isLegendary {
            items[i].sellIn -= 1
        }
    }
}

private extension Item {
    var isLegendary: Bool {
        return name == sulfurasName
    }
}
