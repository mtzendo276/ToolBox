
import SwiftUI

extension Binding {

    func didSet(execute: @escaping (Value) -> Void) -> Binding {
        Binding(
            get: { self.wrappedValue },
            set: {
                self.wrappedValue = $0
                execute($0)
            }
        )
    }

}
