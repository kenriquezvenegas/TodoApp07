//
//  ListView.swift
//  TodoApp07
//
//  Created by Beatriz Enríquez on 31/01/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listviewmodel: ListViewModel
    var body: some View {
        ZStack{
            if listviewmodel.items.isEmpty {
                NoListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else{
                List{
                    ForEach(listviewmodel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.easeOut(duration: 1.1)){
                                    listviewmodel.updateItem(item)
                                }
                            }
                    }
                    .onDelete(perform: listviewmodel.deleteItem)
                    .onMove(perform: listviewmodel.moveItem)
                }
            }
        }
        .navigationTitle("Todo List 🖌")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
    }
}

#Preview {
    NavigationView{
        ListView()
    }.environmentObject(ListViewModel())
}
