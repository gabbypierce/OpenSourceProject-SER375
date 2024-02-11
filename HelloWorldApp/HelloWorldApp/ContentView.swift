//
//  ContentView.swift
//  HelloWorldApp
//
//  Created by Gabby Pierce on 2/7/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello World")
                .font(.title)
                .foregroundColor(.blue)
            HStack {
                Text("Made by Gabby Pierce")
                    .font(.subheadline)
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
