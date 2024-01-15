//
//  DropDownView.swift
//  ToolBox
//
//  Created by Chen Yue on 14/01/24.
//

import SwiftUI

struct DropDownView: View {
    
    var hint: String
    var options: [String]
    var anchor: Anchor = .bottom
    var maxWidth : CGFloat = 180
    var cornerRadius: CGFloat = 15
    @Binding var selection: String?
    
    @State private var showOptions: Bool = false
    
//    @Environment(\.colorScheme) private var scheme
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text(selection ?? hint)
                        .foregroundStyle(selection == nil ? .gray : .primary)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 15)
            .frame(width: size.width, height: size.height)
            .contentShape(.rect)
            .onTapGesture {
                withAnimation {
                    showOptions.toggle()
                }
            }
            .background(Color.white.shadow(.drop(color: .primary.opacity(15),radius: 4)), in: .rect(cornerRadius: cornerRadius))
        }
        .frame(width: maxWidth, height: 50)
    }
    
    @ViewBuilder
    func OptionView() -> some View {
        VStack(spacing: 10) {
            ForEach(options, id: \.self) { option in
                HStack(spacing: 0) {
                    Text(option)
                        .lineLimit(1)
                    Spacer(minLength: 0)
                    Image(systemName: "checkmark")
                        .opacity(selection == option ? 1 : 0)
                }
                .foregroundStyle(selection == option ?  Color.primary : Color.gray)
                .animation(.none, value: selection)
                .frame(height: 40)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selection = option
                        showOptions = false
                    }
                }
            }
        }
    }
    
    enum Anchor {
        case top
        case bottom
    }
    
}

#Preview {
    DropDownContentView()
}
