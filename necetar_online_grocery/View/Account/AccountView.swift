//
//  AccountView.swift
//  necetar_online_grocery
//
//  Created by MACPC on 26/03/24.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack{
            VStack{
                HStack (spacing : 15){
                    Image("profile")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(30)
                    
                    VStack{
                        HStack {
                            Text("Jayesh")
                                .font(.system(size: 16, weight: .bold))
                            Image(systemName: "pencil")
                                .frame(width: 15, height: 15)
                                .foregroundColor(Color(hex: "53B175"))
                            
                        }
                        .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                        .padding(.bottom , 2)
                        
                        Text("chawlajayesh.mobileappdev@gmail.com")
                            .font(.system(size: 16, weight: .regular))
                            .accentColor(.gray)
                    }
                    .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                }
                .padding(.horizontal , 20)
                .padding(.top , .topInsets)
                Divider()
                
                ScrollView{
                    LazyVStack{
                        VStack{
                            AccountRow(title: "Orders", icon: "order")
                            
                            AccountRow(title: "My Details", icon: "card")
                            
                            NavigationLink {
                                DeliveredAddressView()
                            } label: {
                                AccountRow(title: "Delevired Address", icon: "location")
                                    
                            }
                            .foregroundColor(.black)

                           
                            
                            AccountRow(title: "Payment methods", icon: "card1")
                            
                            AccountRow(title: "Promo Cord", icon: "vector1")
                        }
                        VStack{
                            AccountRow(title: "Notificvation", icon: "bell")
                            AccountRow(title: "Help", icon: "help")
                            AccountRow(title: "About", icon: "about")
                        }
                        
                        Button {
                            
                        } label: {
                            ZStack{
                                Text("Logout")
                                    .foregroundColor(Color(hex: "53B175"))
                                    .font(.system(size: 18, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                
                                HStack{
                                    Image("out")
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .padding(.leading , 20)
                                    
                                    Spacer()
                                }
                            }
                           
                        }
                        .frame(minWidth : 0 , maxWidth: .infinity , minHeight : 60 , maxHeight: 60)
                        .background(Color(hex: "F2F3F2"))
                        .cornerRadius(20)
                        .padding(.horizontal , 20)
                        .padding(.bottom ,15)
                        
                    }
                    
                }
           
            }
            .padding(.bottom , .bottomInsets + 60)
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AccountView()
        }
       
    }
}
