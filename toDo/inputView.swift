//
//  inputView.swift
//  toDo
//
//  Created by asmaa gamal  on 31/10/2023.
//

import SwiftUI

struct inputView: View {
    var label:String
    var placeholder:String
    @Binding var text:String
    var body: some View {
        VStack(alignment: .leading){
            Text(label)
            TextField(placeholder, text: $text ).textFieldStyle(.roundedBorder)
        }.padding()
    }
}

//#Preview {
//    inputView()
//}
