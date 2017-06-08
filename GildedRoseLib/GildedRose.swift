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
            updateQuality(of: items[i])
        }
    }

    private func updateQuality(of item: Item) {
        if item.hasStandardQualityRules {
            if (item.quality > 0) {
                if !item.isLegendary {
                    item.quality -= 1
                }
            }
        } else {
            if (item.quality < 50) {
                item.quality += 1

                if (item.name == passesName) {
                    if (item.sellIn < 11) {
                        if (item.quality < 50) {
                            item.quality += 1
                        }
                    }

                    if (item.sellIn < 6) {
                        if (item.quality < 50) {
                            item.quality += 1
                        }
                    }
                }
            }
        }

        decreaseSellInForNonLegendaryItem(item)

        if (item.sellIn < 0) {
            if (item.name != brieName) {
                if (item.name != passesName) {
                    if (item.quality > 0) {
                        if !item.isLegendary {
                            item.quality -= 1
                        }
                    }
                } else {
                    item.quality = 0
                }
            } else {
                if (item.quality < 50) {
                    item.quality += 1
                }
            }
        }
    }

    private func decreaseSellInForNonLegendaryItem(_ item: Item) {
        if !item.isLegendary {
            item.sellIn -= 1
        }
    }
}

private extension Item {
    var isLegendary: Bool {
        return name == sulfurasName
    }

    var hasStandardQualityRules: Bool {
        return name != passesName && name != brieName
    }
}
