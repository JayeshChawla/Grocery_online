//
//  DeliveredAddressView.swift
//  necetar_online_grocery
//
//  Created by MACPC on 26/03/24.
//

import SwiftUI

struct DeliveredAddressView: View {
    
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
   
    
    var body: some View {
        ZStack{
            ScrollView{
                LazyVStack{
                    ForEach(0..<5, id: \.self) { address in

                        HStack(spacing : 15) {
                            VStack{
                                HStack{
                                    Text("My home")
                                        .font(.system(size: 14, weight: .semibold))
                                        .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                                    
                                    Text("home")
                                        .font(.system(size: 12, weight: .bold))
                                        .padding(.horizontal , 8)
                                        .padding(.vertical, 2)
                                        .background(.gray.opacity(0.3))
                                }
                                Text("H-1181 , Jaydeep Society , near Vasna Bhyali , Vadodara , 389151")
                                    .font(.system(size: 14, weight: .medium))
                                    .multilineTextAlignment(.leading)
                                    .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                                
                                Text("8401229422")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.gray)
                                    .padding(.vertical , 8)
                                    .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                            }
                            .padding(.trailing , 8)
                            VStack{
                                Spacer()
                                
                                NavigationLink(destination: {
                                    AddDeliveryAddressView()
                                }, label: {
                                    Image(systemName: "pencil")
                                        .foregroundColor(.black)
                                })
                                
                            
                                .padding(.bottom , 15)
                                
                                Button {
                                    
                                } label: {
                                    Image("close")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                    
                                }
                                Spacer()


                            }
                        }

                    }
                    .padding(20)
                }
            }
            .padding(20)
            .padding(.top , .topInsets + 46)
            
            
            VStack{
                HStack{
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }

                    
                    Spacer()
                    
                    Text("Delivery Address")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                        .frame(height : 46)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image("add1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }

                    
             
                    
                    
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

struct DeliveredAddressView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveredAddressView()
    }
}
