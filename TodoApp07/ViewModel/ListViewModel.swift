//
//  ListViewModel.swift
//  TodoApp07
//
//  Created by Beatriz Enríquez on 31/01/24.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    //Every time initialize this obtject retrieve items the items
    init(){
        getItems()
    }
    
    func addItem(_ title: String){
        let newItem = ItemModel(isCompleted: false, title: title)
        items.append(newItem)
    }
    
    func updateItem(_ item: ItemModel){
        if let index = items.firstIndex(where:{$0.id == item.id}){
            items[index] = item.updateCompleted()
        }
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    
    func saveItems(){
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }
    
    func getItems(){
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else{
            return
        }
        
        guard let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        self.items = saveItems
        
    }
    
    
}
