//
//  LineTextField.swift
//  necetar_online_grocery
//
//  Created by MACPC on 18/03/24.
//

import SwiftUI

struct LineTextField: View {
   
    @State var title: String = "Title"
    @State var placeholder : String = "Placeholder"
    @Binding var txt : String
    @State var keyboardType : UIKeyboardType = .default
    @State var isPassword : Bool = false
    
    var body: some View {
        VStack(alignment : .leading){
            Text(title)
                .foregroundColor(.black.opacity(0.8))
                .font(.system(size: 16, weight: .semibold))
                .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
            
            
          
                TextField(placeholder , text: $txt)
                    .keyboardType(keyboardType)
                    .frame(height : 40)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            
            Divider()
        }
    }
}

struct LineSecureField: View {
    @Binding var txt : String
    @State var title: String = "Title"
    @State var placeholder : String = "Placeholder"
    @Binding var isPassword : Bool
  
    
    var body: some View {
        VStack (alignment : .leading ){
            Text(title)
                .foregroundColor(.black.opacity(0.8))
                .font(.system(size: 16, weight: .semibold))
               
            
            if(isPassword){
                
                TextField(placeholder , text: $txt)
                    .disableAutocorrection(true)
                    .modifier(ShowButton(isShow: $isPassword))
                 
                    .frame(height : 40)
                    
            }else{
                SecureField(placeholder, text: $txt)
                    .frame(height : 40)
                    .modifier(ShowButton(isShow: $isPassword))
            }
            Divider()
        }
    }
}

struct LineTextField_Previews: PreviewProvider {
    @State static var txt : String = ""
    
    static var previews: some View {
        LineTextField(txt : $txt)
            .padding(20)
    }
}
