//
//  ParallaxScrollView.swift
//  ToolBox
//
//  Created by Chen Yue on 13/01/24.
//

import SwiftUI

struct ParallaxScrollView: View {
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 15) {
                DummySection(title: "Social Media")
                DummySection(title: "Sales", isLong: true)
                ParallaxImageView(useFullWidth: true) { size in
                    Image(.pic1)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                }
                .frame(height: 400)
                DummySection(title: "Busniess", isLong: true)
                DummySection(title: "Promotion", isLong: true)
                ParallaxImageView(maxMovement: 150, useFullWidth: false) { size in
                    Image(.pic2)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                }
                .frame(height: 300)
                DummySection(title: "YouTube")
                DummySection(title: "Twitter (X)", isLong: true)
            }
            .padding(15)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    func DummySection(title: String, isLong: Bool = false) -> some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(title)
                .font(.title.bold())
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \(isLong ? " It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged." : "")")
                .multilineTextAlignment(.leading)
                .kerning(1.2)
        })
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
}

struct ParallaxImageView<Content: View>: View {
    
    var maxMovement: CGFloat = 100
    var useFullWidth: Bool = false
    
    @ViewBuilder var content: (CGSize) -> Content
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let minY = $0.frame(in: .scrollView(axis: .vertical)).minY
            let scrollViewHeight = $0.bounds(of: .scrollView)?.size.height ?? 0
            let maximumMovement = min(maxMovement, (size.height * 0.35))
            let stretchedSize: CGSize = .init(width: size.width, height: size.height + maximumMovement)
            
            let progress = minY / scrollViewHeight
            let cappedProgress = max(min(progress, 1.0), -1.0)
            let movementOffset = cappedProgress * -maximumMovement
            
            content(size)
                .offset(y: movementOffset)
                .frame(width: stretchedSize.width,
                       height: stretchedSize.height)
                .frame(width: size.width,
                       height: size.height)
                .overlay(alignment: .bottom) {
                    Text("\(cappedProgress)")
                        .font(.title)
                        .foregroundStyle(.white)
                }
                .clipped()
        }
        .containerRelativeFrame(useFullWidth ? [.horizontal] : [])
    }
}

#Preview {
    ParallaxScrollView()
}
