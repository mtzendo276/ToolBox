//
//  CarouselView.swift
//  ToolBox
//
//  Created by Chen Yue on 19/01/24.
//

import SwiftUI

struct CarouselView: View {
    var body: some View {
        ScrollView(.vertical) {
            GeometryReader(content: { proxy in
                let size = proxy.size
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(tripList) { card in
                            GeometryReader(content: { geometry in
                                let cardSize = geometry.size
                                let minX = min(geometry.frame(in: .scrollView).minX * 1.4, geometry.size.width * 1.5)
                                Image(card.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .offset(x: -minX)
                                    .frame(width: cardSize.width * 2.5)
                                    .frame(width: cardSize.width, height: cardSize.height)
                                    .overlay(content: {
                                        OverlayView(card: card)
                                    })
                                    .clipShape(.rect(cornerRadius: 20))
                                    .shadow(color: .black.opacity(0.15), radius: 8, x: 5, y: 10)
                            })
                            .frame(width: size.width - 60, height: size.height - 50)
                            .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                view.scaleEffect(phase.isIdentity ? 1 : 0.95)
                                
                            }
                        }
                    }
                    .padding(20)
                    .scrollTargetLayout()
                    .frame(height: size.height, alignment: .top)
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
            })
            .frame(height: 500)
            .padding(.horizontal, -15)
            .padding(.top, 10)
        }
        .padding()
    }
    
    @ViewBuilder
    func OverlayView(card: TripCard) -> some View {
        ZStack(alignment: .bottomLeading, content: {
            LinearGradient(colors: [.clear, 
                                    .clear,
                                    .clear,
                                    .black.opacity(0.1),
                                    .black.opacity(0.5),
                                    .black],
                           startPoint: .top,
                           endPoint: .bottom)
            VStack(alignment: .leading, spacing: 4, content: {
                Text("\(card.title)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                Text("\(card.subtitle)")
            })
            .foregroundColor(.white)
            .padding()
        })
    }
    
}

#Preview {
    CarouselContentView()
}
