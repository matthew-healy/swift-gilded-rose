import Foundation

extension Integer where Stride: SignedInteger {
    func clamped(to range: CountableClosedRange<Self>) -> Self {
        guard !range.contains(self) else { return self }
        return self > range.upperBound ? range.upperBound : range.lowerBound
    }
}
