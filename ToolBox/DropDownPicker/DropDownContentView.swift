//
//  DropDownContentView.swift
//  ToolBox
//
//  Created by Chen Yue on 15/01/24.
//

import SwiftUI

struct DropDownContentView: View {
    
    @State private var selection1: String?
    @State private var selection2: String?
    
    var body: some View {
        VStack(spacing: 15) {
            DropDownView(hint: "Select", options: [
                    "YouTube",
                    "Instagram",
                    "Twitter",
                    "Snapchat",
                    "TikTok"
                ],
                anchor: .bottom,
                selection: $selection1
            )
            DropDownView(hint: "Select", options: [
                    "Short Form",
                    "Long Form",
                    "Both"
                ],
                anchor: .top,
                selection: $selection2
            )
        }
    }
    
}

#Preview {
    DropDownContentView()
}
