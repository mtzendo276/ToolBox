//
//  CardModel.swift
//  ToolBox
//
//  Created by Chen Yue on 13/01/24.
//

import SwiftUI

struct TripCard: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var subtitle: String
    var image: String
}

var tripList: [TripCard] = [
    TripCard(title: "Place 1", subtitle: "a place", image: "pic1"),
    TripCard(title: "Place 2", subtitle: "a place", image: "pic2"),
    TripCard(title: "Place 3", subtitle: "a place", image: "pic3"),
]
