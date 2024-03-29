//
//  InfiniteScrollView.swift
//  ToolBox
//
//  Created by Chen Yue on 19/01/24.
//

import SwiftUI

struct InfiniteScrollView<Content: View, Item: RandomAccessCollection>: View where Item.Element: Identifiable {
    
    var width: CGFloat
    var spacing: CGFloat = 0
    var items: Item
    @ViewBuilder var content: (Item.Element) -> Content
    var body: some View {
        GeometryReader {
            let size = $0.size
            let repeatingCount = width > 0 ? Int((size.width / width).rounded()) + 1 : 1
            ScrollView(.horizontal) {
                LazyHStack(spacing: spacing) {
                    ForEach(items) { item in
                        content(item)
                            .frame(width: width)
                        
                    }
                    ForEach(0..<repeatingCount, id: \.self) { index in
                        let item = Array(items)[index % items.count]
                        content(item)
                            .frame(width: width)
                    }
                }
                .background {
                    ScrollViewHelper(width: width,
                                     spacing: spacing,
                                     itemsCount: items.count,
                                     repeatingCount: repeatingCount)
                }
            }
        }
    }
}

fileprivate struct ScrollViewHelper: UIViewRepresentable  {
    
    var width: CGFloat
    var spacing: CGFloat
    var itemsCount: Int
    var repeatingCount: Int
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(width: width,
                           spacing: spacing,
                           itemsCount: itemsCount,
                           repeatingCount: repeatingCount)
    }
    
    func makeUIView(context: Context) -> some UIView {
        return .init()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
            if let scrollView = uiView.superview?.superview?.superview as? UIScrollView, !context.coordinator.isAdded {
                scrollView.delegate = context.coordinator
                context.coordinator.isAdded = true
            }
        }
        context.coordinator.width = width
        context.coordinator.spacing = spacing
        context.coordinator.itemsCount = itemsCount
        context.coordinator.repeatingCount = repeatingCount
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var width: CGFloat
        var spacing: CGFloat
        var itemsCount: Int
        var repeatingCount: Int
        
        var isAdded: Bool = false
    
        init(width: CGFloat, spacing: CGFloat, itemsCount: Int, repeatingCount: Int) {
            self.width = width
            self.spacing = spacing
            self.itemsCount = itemsCount
            self.repeatingCount = repeatingCount
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            guard itemsCount > 0 else { return }
            let minX = scrollView.contentOffset.x
            let mainContentSize = CGFloat(itemsCount) * width
            let spacingSize = CGFloat(itemsCount) * spacing
            if minX > (mainContentSize + spacingSize) {
                scrollView.contentOffset.x -= (mainContentSize + spacingSize)
            }
            if minX < 0 {
                scrollView.contentOffset.x += (mainContentSize + spacingSize)
            }
        }
    }
    
}

#Preview {
    InfiniteScrollViewContentView()
}
