//
//  DataManger.swift
//  toDo
//
//  Created by asmaa gamal  on 31/10/2023.
//

import Foundation
import CoreData
class DataManger{
    static let shared = DataManger()
    
    lazy var persistentContainer: NSPersistentContainer = {
           let container = NSPersistentContainer(name: "toDo")
           container.loadPersistentStores { description, error in
               if let error = error {
                   print(error)
                   fatalError("Unable to load persistent stores: \(error)")
               }else{
                   print("loaded")
               }
           }
           return container
       }()
    
    func fetchUser(name:String)->[User]{
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "name == [c] %@" , name)
        do{
            let user = try persistentContainer.viewContext.fetch(request)
            return user
        }catch{
            print(error)
            return []
        }
    }
    
    
    func saveDtat(name:String){
        if let entity = NSEntityDescription.entity(forEntityName: "User", in: persistentContainer.viewContext ){
            let user = NSManagedObject(entity: entity , insertInto: persistentContainer.viewContext)
            user.setValue(name, forKey: "name")
            
            
        }
    }
    
    func delete(user:User, mewName:String){
      
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func fetchUsers()->[User]{
        let fetchRequest: NSFetchRequest<User>  = User.fetchRequest()
        do{
            let users = try persistentContainer.viewContext.fetch(fetchRequest)
            return users
        }catch{
            print(error)
            return []
        }
     
    }
    
    func addUser(name:String){
        if let entity = NSEntityDescription.entity(forEntityName: "User", in: persistentContainer.viewContext){
            let user = NSManagedObject(entity: entity, insertInto: persistentContainer.viewContext)
            user.setValue(name, forKey: "name")
            do {
                try persistentContainer.viewContext.save()
                print("added")
            }catch{
                print(error)
            }
        }
    }
    
    func deleteUser(user:User){
        persistentContainer.viewContext.delete(user)
        do{
            try persistentContainer.viewContext.save()
            print("deleted")
        }catch{
            print(error)
        }
    }
    
    func updateUser(user:User, newName:String){
        user.name = newName
        do{
            try persistentContainer.viewContext.save()
            print("updated")
        }catch{
            print(error)
        }
    }
    
    
    func addTask(title:String , details:String ,user:User){
        if let entity = NSEntityDescription.entity(forEntityName: "Task", in: persistentContainer.viewContext){
            let task = NSManagedObject(entity: entity, insertInto: persistentContainer.viewContext )
            task.setValue(title, forKey: "title")
            task.setValue(details, forKey: "details")
            user.addToTasks(task as! Task)
            task.setValue(false, forKey: "status")
            do {
                try persistentContainer.viewContext.save()
                print ("task added")
            }catch {
                print(error)
            }
            
            
        }
    }
    
    func  updateTask(task:Task ){
        task.status.toggle()
        do {
            try persistentContainer.viewContext.save()
            print("Done")
        }catch{
            print(error)
        }
        
    }
    
    
    func fetchDoneTasks()->[Task]{
        var request: NSFetchRequest<Task> {
            let request = NSFetchRequest<Task>(entityName: "Task")
            request.sortDescriptors = [
                NSSortDescriptor(
                    key:"title",
                    ascending: true)]
            request.predicate = NSPredicate(format: "status == true", NSNumber(value: true))
            request.fetchLimit = 1000
            return request
        }
        
        do {
           let results =  try persistentContainer.viewContext.fetch(request)
            return results
        }catch{
            print(error)
            return []
        }
    }
    
    
}
