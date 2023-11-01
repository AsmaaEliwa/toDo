//
//  DoneTasks.swift
//  toDo
//
//  Created by asmaa gamal  on 01/11/2023.
//

import SwiftUI

struct DoneTasks: View {
    @State var doneTasks = DataManger.shared.fetchDoneTasks()
     var user  = DataManger.shared.fetchUser(name: "asmaa")
    
    var body: some View {
        VStack{
            
            
            List{
                ForEach(doneTasks, id:\.self){task in
                    Text(task.title ?? "")
                    
                }
            }
            if !user.isEmpty{
                Text(user[0].name ?? "")
            }
           
            
            
        }
    }
}

#Preview {
    DoneTasks()
}
