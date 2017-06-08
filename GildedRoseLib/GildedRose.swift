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
            item.updateQuality(by: -1)
        } else {
            item.updateQuality(by: 1)
            if (item.name == LegacyItemIdentifier.passes) {
                if (item.sellIn < 11) {
                    item.updateQuality(by: 1)
                }

                if (item.sellIn < 6) {
                    item.updateQuality(by: 1)
                }
            }
        }

        decreaseSellInForNonLegendaryItem(item)

        if (item.sellIn < 0) {
            if (item.name != LegacyItemIdentifier.brie) {
                if (item.name != LegacyItemIdentifier.passes) {
                    item.updateQuality(by: -1)
                } else {
                    item.quality = 0
                }
            } else {
                item.updateQuality(by: 1)
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
        return name == LegacyItemIdentifier.sulfuras
    }

    var hasStandardQualityRules: Bool {
        return name != LegacyItemIdentifier.passes
            && name != LegacyItemIdentifier.brie
            && !isLegendary
    }

    func updateQuality(by modifier: Int) {
        guard !isLegendary else { return }
        let newQuality = quality + modifier
        quality = newQuality.clamped(to: 0...50)
    }
}
