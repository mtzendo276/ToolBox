//
//  Toggle+Extensions.swift
//  AnchorApp
//
//  Created on 8/11/22.
//  Copyright © 2022 Predict Wind. All rights reserved.
//

import SwiftUI

extension Toggle where Label == Text {
    
    public init(_ titleKey: LocalizedStringKey, isOn: Binding<Bool>, onToggled: @escaping (Bool) -> Void) {
        self.init(titleKey, isOn: isOn.didSet(execute: { value in onToggled(value) }))
    }
    public init<S>(_ title: S, isOn: Binding<Bool>, onToggled: @escaping (Bool) -> Void) where S: StringProtocol {
        self.init(title, isOn: isOn.didSet(execute: { value in onToggled(value) }))
    }
    
}
