
import SwiftUI
import Combine

/// Publisher to read keyboard changes.
protocol KeyboardReadable {

    var keyboardPublisher: AnyPublisher<Bool, Never> { get }

}

extension KeyboardReadable {

    var keyboardPublisher: AnyPublisher<Bool, Never> {
        Publishers.Merge(
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillShowNotification)
                .map { _ in true },

            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in false }
        )
        .eraseToAnyPublisher()
    }
    
}
