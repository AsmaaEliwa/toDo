//
//  usersView.swift
//  toDo
//
//  Created by asmaa gamal  on 31/10/2023.
//

import SwiftUI

struct usersView: View {
    @ObservedObject var userModel = UserModel()
    @State var username = ""
    var body: some View {
        VStack{
            Text("Home").padding()
            Divider()
            inputView(label: "Enter User name", placeholder:"User name" , text: $username  )
            Button{
                userModel.addUser(name: username )
                username = ""
            }label: {
                Label("Add User" , systemImage: "person.fill")
            }
            List{
                ForEach(userModel.users , id: \.self){ user in
                    
                    HStack{
                        NavigationLink(destination:UserDetails(user:user)){
                            
                            Text(user.name ?? "")
                        }
                    }
                           
                        
                        }
                
            }
        }
    }
}

#Preview {
    usersView()
}
