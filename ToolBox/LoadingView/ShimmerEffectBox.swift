//
//  ShimmerEffectBox.swift
//  ToolBox
//
//  Created by Chen Yue on 6/01/24.
//

import SwiftUI

struct ShimmerEffectBox: View {
    
    @State private var isAnimating = false
    @State var startPoint: UnitPoint = .init(x: 0, y: 0)
    @State var endPoint: UnitPoint = .init(x: 1, y: 1)
    
    private var gradientColors = [
        Color.gray,
        Color.clear,
        Color.gray
    ]
    
    var body: some View {
        LinearGradient(colors: gradientColors,
                       startPoint: startPoint,
                       endPoint: endPoint)
        .onAppear {
            withAnimation(.easeInOut(duration: 5)
                .repeatForever(autoreverses: false)) {
                    isAnimating.toggle()
                }
        }
    }
}

#Preview {
    ShimmerEffectBox()
}
