//
//  ListRowView.swift
//  TodoApp07
//
//  Created by Beatriz Enríquez on 31/01/24.
//

import SwiftUI
var item1 = ItemModel(isCompleted: true, title: "Item 1")
struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.vertical, 8)
    }
}

#Preview {
    ListRowView(item: item1)
}
