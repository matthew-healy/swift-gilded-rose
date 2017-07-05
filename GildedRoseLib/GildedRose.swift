public class GildedRose {
    var items:[Legacy.Item]
    
    required public init(items:[Legacy.Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for i in 0..<items.count {
            updateQuality(of: items[i])
        }
    }

    private func updateQuality(of item: Legacy.Item) {
        if item.hasStandardQualityRules {
            item.updateQuality(by: -1)
        } else {
            item.updateQuality(by: 1)
            if (item.name == Legacy.ItemIdentifier.passes) {
                if (item.sellIn < 11) {
                    item.updateQuality(by: 1)
                }

                if (item.sellIn < 6) {
                    item.updateQuality(by: 1)
                }
            }
        }

        item.updateSellIn()

        if (item.sellIn < 0) {
            if (item.name != Legacy.ItemIdentifier.brie) {
                if (item.name != Legacy.ItemIdentifier.passes) {
                    item.updateQuality(by: -1)
                } else {
                    item.quality = 0
                }
            } else {
                item.updateQuality(by: 1)
            }
        }
    }
}

private extension Legacy.Item {
    var isLegendary: Bool {
        return name == Legacy.ItemIdentifier.sulfuras
    }

    var hasStandardQualityRules: Bool {
        return name != Legacy.ItemIdentifier.passes
            && name != Legacy.ItemIdentifier.brie
            && !isLegendary
    }

    func updateQuality(by modifier: Int) {
        guard !isLegendary else { return }
        let newQuality = quality + modifier
        quality = newQuality.clamped(to: 0...50)
    }

    func updateSellIn() {
        guard !isLegendary else { return }
        sellIn -= 1
    }
}
