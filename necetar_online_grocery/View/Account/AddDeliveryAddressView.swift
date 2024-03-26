//
//  AddDeliveryAddressView.swift
//  necetar_online_grocery
//
//  Created by MACPC on 26/03/24.
//

import SwiftUI

struct AddDeliveryAddressView: View {
    
//    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @Environment(\.presentationMode) var presentationMode
    @State private var isEdit : Bool = false
    @State var txtHome : Bool =  true
    @State var txtOffice : Bool =  false
    @State var txtName : String = ""
    @State var txtPhone : String = ""
    @State var txtAddress : String = ""
    @State var txtCity : String = ""
    @State var txtState : String = ""
    @State var txtPostal : String = ""
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack(spacing : 15){
                    HStack{
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Home")
                            Image(systemName: txtHome ?  "record.circle" : "circle")
                        }
                        .foregroundColor(.black)
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Office")
                            Image(systemName: txtOffice ?  "record.circle" : "circle")
                        }
                        .foregroundColor(.black)
                        
                        Spacer()

                    }
                    .padding(.bottom , 15)
                    
                    LineTextField(title: "Name", placeholder: "Enter your Name" , txt: $txtName)
                    
                    LineTextField(title: "Phone no,", placeholder: "Enter your Number" , txt: $txtPhone , keyboardType: .numberPad)
                    
                    LineTextField(title: "Address", placeholder: "Enter your Address" , txt: $txtAddress)
                    
                    HStack{
                        LineTextField(title: "City", placeholder: "Enter your City" , txt: $txtCity)
                        LineTextField(title: "State", placeholder: "Enter your State" , txt: $txtState)
                    }
                    LineTextField(title: "Postal Code", placeholder: "Enter your PostalCode" , txt: $txtPostal)
                    
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Add Address")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .frame(minWidth : 0 , maxWidth: .infinity , minHeight: 60 , maxHeight: 60)
                            .background(Color(hex: "53B175"))
                            .cornerRadius(20)
                    }

                    

                    
                }
                .padding(20)
                .padding(.top , .topInsets + 45)
            }
            
            
            VStack{
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }

                    
                    Spacer()
                    
                    Text(isEdit ? "Edit Delivery Address" : " Add Delivery Address")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                        .frame(height : 46)
                    
                    Spacer()
                    
                   

                    
             
                    
                    
                }
                .padding(.horizontal , 10)
                .padding(.top , .topInsets)
                .background(.white)
                .shadow(color: .black.opacity(0.2), radius: 2)
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct AddDeliveryAddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeliveryAddressView()
    }
}
