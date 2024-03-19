//
//  SearchTextField.swift
//  necetar_online_grocery
//
//  Created by MACPC on 19/03/24.
//

import SwiftUI

struct SearchTextField: View {
    @State var placeholder : String = "Placeholder"
    @Binding var txt : String
    
    var body: some View {
       
        HStack (spacing : 15){
            
            Image("search")
                .resizable()
                .scaledToFit()
                .frame(width: 19, height: 19)
            
            TextField(placeholder, text: $txt)
                .font(.system(size: 17, weight: .regular))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(minWidth : 0 , maxWidth: .infinity)
            
        }
        .frame(height : 30)
        .padding(15)
        .background(Color(hex: "F2F3F2"))
        .cornerRadius(16)
        
    }

}
struct SearchTextField_Previews: PreviewProvider {
    
    @State static var txt : String = ""
    static var previews: some View {
        SearchTextField(placeholder: "Search here", txt: $txt)
    }
}
