//
//  ShimmerEffectBox.swift
//  ToolBox
//
//  Created by Chen Yue on 6/01/24.
//

import SwiftUI

struct ShimmerEffectBox: View {
    
    @State var startPoint: UnitPoint = .init(x: -1.8, y: -1.2)
    @State var endPoint: UnitPoint = .init(x: 0, y: -0.2)
    
    private var gradientColors = [
        Color(uiColor: .systemGray5),
        Color(uiColor: .systemGray6),
        Color(uiColor: .systemGray5)
    ]
    
    var body: some View {
        LinearGradient(colors: gradientColors,
                       startPoint: startPoint,
                       endPoint: endPoint)
        .onAppear {
            withAnimation(.easeInOut(duration: 1)
                .repeatForever(autoreverses: false)) {
                    startPoint = .init(x: 1, y: 1)
                    endPoint = .init(x: 2.2, y: 2.2)
                }
        }
    }
}

#Preview {
    ShimmerEffectBox()
}
