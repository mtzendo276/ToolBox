//
//  ContentView.swift
//  ToolBox
//
//  Created by Chen Yue on 19/01/24.
//

import SwiftUI
import SwiftData

fileprivate struct TableSection {
    
    let title: String
    let items: [String]
    
}

struct ContentView: View {
    
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
    
    private let tableSections = [TableSection(title: "UI",
                                              items: ["Loading",
                                                      "Tags",
                                                      "Toast",
                                                      "Parallax ScrollView",
                                                      "Drop Down",
                                                      "Infinite ScrollView",
                                                      "Parallax Carousel"])]

    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
        NavigationStack {
            List {
//                ForEach(tableSections, id: \.title) { section in
                ForEach(tableSections.indices, id: \.self) { sectionIndex in
                    let section = tableSections[sectionIndex]
                    Section(header:
                                Text(section.title)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.gray)
                    ) {
                        ForEach(section.items.indices, id: \.self) { itemIndex in
                            let item = section.items[itemIndex]
                            NavigationLink(destination: genercateView(sectionIndex, itemIndex)) {
                                Text("\(item)")
                                
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("ToolBox")
        }
    }
    
    @ViewBuilder
    func genercateView(_ section: Int, _ row: Int) -> some View {
        if section == 0 {
            switch(row) {
            case 0:
                ShimmerLoadingView()
            case 1:
                TagsContentView()
            case 2:
                ToastContentView()
            case 3:
                ParallaxScrollView()
            case 4:
                DropDownContentView()
            case 5:
                InfiniteScrollViewContentView()
            case 6:
                CarouselContentView()
            default:
                Text("Default")
            }
        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

#Preview {
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
