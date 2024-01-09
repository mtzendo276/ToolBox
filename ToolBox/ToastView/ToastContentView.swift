//
//  ToastContentView.swift
//  ToolBox
//
//  Created by Chen Yue on 8/01/24.
//

import SwiftUI

struct ToastContentView: View {
    
    var body: some View {
        RootView {
            Button("Present toast!") {
                Toast.shared.present(title: "Hellow World", 
                                     symbol: "globe",
                                     isUserInteractionEnabled: true,
                                     timing: .long)
            }
        }
    }
    
}

#Preview {
    ToastContentView()
}
