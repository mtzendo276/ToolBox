//
//  InfiniteScrollViewContentView.swift
//  ToolBox
//
//  Created by Chen Yue on 19/01/24.
//

import SwiftUI

struct SampleItem: Identifiable {
    
    var id: UUID = .init()
    var color: Color
    
}


struct InfiniteScrollViewContentView: View {
    
    @State private var items: [SampleItem] = [.red,
        .blue,
        .green,
        .yellow,
        .black].compactMap { .init(color: $0) }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                GeometryReader {
                    let size = $0.size
                    InfiniteScrollView(width: size.width,
                                       spacing: 0,
                                       items: items) { item in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(item.color.gradient)
                            .padding(.horizontal, 15)
                    }
//                    .contentMargins(.horizontal, 15, for: .scrollContent)
                    .scrollTargetBehavior(.paging)
                }
                .frame(height: 150)
            }
            .padding(.vertical, 15)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    InfiniteScrollViewContentView()
}
