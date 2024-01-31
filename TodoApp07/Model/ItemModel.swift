//
//  ItemModel.swift
//  TodoApp07
//
//  Created by Beatriz Enríquez on 31/01/24.
//

import Foundation
struct ItemModel: Identifiable, Codable {
    var id: String
    let isCompleted: Bool
    let title: String
    
    init(id: String = UUID().uuidString, isCompleted: Bool, title: String) {
        self.id = id
        self.isCompleted = isCompleted
        self.title = title
    }
    
    func updateCompleted() -> ItemModel {
        return ItemModel(id: id, isCompleted: !isCompleted, title: title)
    }
    
    
}
