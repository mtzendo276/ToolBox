
import SwiftUI

struct BoundsPreferenceKey: PreferenceKey {

    static var defaultValue: [Anchor<CGRect>] = []
    static func reduce(value: inout [Anchor<CGRect>], nextValue: () -> [Anchor<CGRect>]) {
        value.append(contentsOf:nextValue())
    }

}
