//
//  TagLayout.swift
//  ToolBox
//
//  Created by Chen Yue on 7/01/24.
//

import SwiftUI

struct TagLayout: Layout {
    
    var alignment: Alignment = .center
    var spacing: CGFloat = 10
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidth = proposal.width ?? 0
        var height: CFloat = 0
        let rows = generateRows(maxWidth, proposal, subviews)
        for (index, row) in rows.enumerated() {
            //Finding max height in each row and adding it to the view's total height
            if index == (row.count - 1) {
                //since there is no spacing needed for the last item
                height += Float(row.maxHeight(proposal))
            } else {
                height += Float(row.maxHeight(proposal) + spacing)
            }
        }
        return .init(width: maxWidth, height: CGFloat(height))
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        //Placing views
        var origin = bounds.origin
        let maxWidth = bounds.width
        let rows = generateRows(maxWidth, proposal, subviews)
        for row in rows {
            let leading: CGFloat = bounds.maxX - maxWidth
            let trailing = bounds.maxX - (row.reduce(CGFloat.zero) { partialResult, view in
                let width = view.sizeThatFits(proposal).width
                if view == row.last {
                    return partialResult + spacing
                }
                return partialResult + width + spacing
            })
            let center = (trailing + leading) / 2
            //Resetting origin X to zero for each row
            origin.x = (alignment == .leading ? leading : alignment == .trailing ? trailing : center)
            //spacing*3
            for view in row {
                let viewSize = view.sizeThatFits(proposal)
                view.place(at: origin, proposal: proposal)
                //Updating origin X
                origin.x += (viewSize.width + spacing)
            }
            //updating origin Y
            origin.y += (row.maxHeight(proposal) + spacing)
        }
    }
    
    func generateRows(_ maxWidth: CGFloat,
                      _ proposal: ProposedViewSize,
                      _ subviews: Subviews) -> [[LayoutSubviews.Element]] {
        var row: [LayoutSubviews.Element] = []
        var rows: [[LayoutSubviews.Element]] = []
        
        var origin = CGRect.zero.origin
        
        for view in subviews {
            let viewSize = view.sizeThatFits(proposal)
            //Pushing to New Row
            if (origin.x + viewSize.width + spacing) > maxWidth {
                rows.append(row)
                row.removeAll()
                //Reseting X Origin since it needs to start from left to right
                origin.x = 0
                row.append(view)
                //Updating Origin X
                origin.x += (viewSize.width + spacing)
            } else {
                //Adding item to same row
                row.append(view)
                //Updating Origin X
                origin.x += (viewSize.width + spacing)
            }
        }
        //Checking for any exhaust row
        if !row.isEmpty {
            rows.append(row)
            row.removeAll()
        }
        return rows
    }
    
}

extension [LayoutSubviews.Element] {
    
    func maxHeight(_ proposal: ProposedViewSize) -> CGFloat {
        return self.compactMap { view in
            return view.sizeThatFits(proposal).height
        }.max() ?? 0
    }
    
}

#Preview {
    TagsContentView()
}
