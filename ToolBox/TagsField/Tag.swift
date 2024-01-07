//
//  Tag.swift
//  ToolBox
//
//  Created by Chen Yue on 7/01/24.
//

import Foundation

struct Tag: Identifiable, Hashable {
    
    var id: UUID = .init()
    var value: String
    var isInitial: Bool = false
    
}
