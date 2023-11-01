//
//  UserDetails.swift
//  toDo
//
//  Created by asmaa gamal  on 31/10/2023.
//

import SwiftUI

struct UserDetails: View {
    @ObservedObject var userModel = UserModel()
    @AppStorage("logIn") var logedIn = true
    @State var user : User
    @State var username = ""
    @State var showAlert = false
    @State var showAddTask = false
    @State var taskName = ""
    @State var taskDetails = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing:30){
            Text(user.name ?? "")
            HStack{
                
                Button{
                    showAlert = true
                }label: {
                    Label("Update",systemImage: "pen.fill")
                }
                Button{
                    userModel.deleteUser(user:user)
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    Label("Delete",systemImage: "delete.fill").foregroundColor(.red)
                }
                .sheet(isPresented: $showAlert , content: {
                    VStack(spacing:30){
                        TextField("Enter New Name", text: $username)
                        Button{
                            userModel.updateUser(user: user, newName: username)
                            showAlert = false
                        }label: {
                            Label("Update",systemImage: "pin.fill")
                        }
                    }
                })
            }
            Button{
                showAddTask = true
            }label: {
                Label("Add Task",systemImage: "plus.fill").foregroundColor(.green)
            }
            .sheet(isPresented: $showAddTask, content : {
                VStack (spacing:30){
                    TextField("Task Label", text: $taskName)
                    TextField("Task Details", text: $taskDetails)
                    Button{
                        DataManger.shared.addTask(title: taskName, details: taskDetails, user: user)
                        showAddTask = false
                    }label: {
                        Label("Add",systemImage: "plus.fill")
                        
                    }
                }.padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
            })
        }
        
        List{
            ForEach(Array(user.tasks as? Set<Task> ?? []), id: \.self){ task in
                HStack{
                    if task.status == false {
                        Text(task.title ?? "")
                    } else {
                        Label(task.title ?? "", systemImage: "checkmark").foregroundColor(.green)
                    }
                }.onTapGesture {
                    print("Before Update: Task Status: \(task.status)")
                    DataManger.shared.updateTask(task: task)
                    print("After Update: Task Status: \(task.status)")
                }
            }
        }
        
        NavigationLink(destination:DoneTasks()){
            Label("Show Done Tasks",systemImage: "up.fill")
        }
    }
}
//#Preview {
//    UserDetails(user:User())
//}
