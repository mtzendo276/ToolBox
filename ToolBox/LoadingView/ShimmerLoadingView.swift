//
//  ShimmerLoadingView.swift
//  ToolBox
//
//  Created by Chen Yue on 6/01/24.
//

import SwiftUI

struct ShimmerLoadingView: View {
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                HStack {
                    ShimmerEffectBox()
                        .cornerRadius(30)
                        .frame(width: 60, height: 60)
                    VStack {
                        ShimmerEffectBox()
                            .frame(height: 25)
                        ShimmerEffectBox()
                            .frame(height: 25)
                    }
                    .padding(.leading)
                }
                ShimmerEffectBox()
                    .frame(height: 200)
                    .padding(.vertical, 12)
            }
            .padding()
        }
    }
    
}

#Preview {
    ShimmerLoadingView()
}
