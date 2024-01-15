//
//  DropDownContentView.swift
//  ToolBox
//
//  Created by Chen Yue on 15/01/24.
//

import SwiftUI

struct DropDownContentView: View {
    
    @State private var selection: String?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                DropDownView(hint: "Select", options: [
                        "YouTube",
                        "Instagram",
                        "Twitter",
                        "Snapchat",
                        "TikTok"
                    ],
                    selection: $selection
                )
            }
            .navigationTitle("Dropdown Picker")
        }
    }
    
}

#Preview {
    DropDownContentView()
}
