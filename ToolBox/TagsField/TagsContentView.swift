//
//  TagsContentView.swift
//  ToolBox
//
//  Created by Chen Yue on 7/01/24.
//

import SwiftUI

struct TagsContentView: View {
    
    @State private var tags: [Tag] = []
    
    var body: some View {
        VStack {
            TagField(tags: $tags)
        }
        .padding()
    }
    
}

#Preview {
    TagsContentView()
}
