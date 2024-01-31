//
//  TodoApp07App.swift
//  TodoApp07
//
//  Created by Beatriz Enríquez on 31/01/24.
//

import SwiftUI

@main
struct TodoApp07App: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
