//
//  toDoApp.swift
//  toDo
//
//  Created by asmaa gamal  on 31/10/2023.
//

import SwiftUI

@main
struct toDoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                usersView()
                    .environment(\.managedObjectContext, DataManger.shared.persistentContainer.viewContext)
            }
        }
    }
}
