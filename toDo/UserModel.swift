//
//  UserModel.swift
//  toDo
//
//  Created by asmaa gamal  on 31/10/2023.
//

import Foundation
class UserModel: ObservableObject{
    @Published var users = DataManger.shared.fetchUsers()
    func addUser(name: String){
        DataManger.shared.addUser(name: name)
        users = DataManger.shared.fetchUsers()
    }
    
    func deleteUser(user:User){
        DataManger.shared.deleteUser(user: user)      
        users = DataManger.shared.fetchUsers()
    }
    
    func updateUser(user:User , newName:String){
        DataManger.shared.updateUser(user: user,newName:newName)
        users = DataManger.shared.fetchUsers()
    }
    
    
}
