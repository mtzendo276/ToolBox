import SwiftUI

extension AnyTransition {

    static var reverseslide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading))
    }

}
