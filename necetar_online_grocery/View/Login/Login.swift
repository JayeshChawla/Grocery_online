//
//  Login.swift
//  necetar_online_grocery
//
//  Created by MACPC on 18/03/24.
//

import SwiftUI

struct Login: View {
    
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var loginVM = MainViewModel.shared;
    
    
    var body: some View {
        ZStack{
            Image("full")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
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

                }
                Spacer()
            }
            .padding(.top , .topInsets)
            .padding(.horizontal , 20)
            
            
            VStack{
                Image("carrot")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .padding(.bottom , .screenWidth * 0.1)
                
                Text("Loging")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .semibold))
                    .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                    .padding(.bottom , 5)
                
                Text("Enter email and password")
                    .foregroundColor(Color(hex: "7C7C7C"))
                    .font(.system(size: 16, weight: .medium))
                    .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                    .padding(.bottom , .screenWidth * 0.1)
                
                LineTextField(title: "Email", placeholder: "Enter your email", txt: $loginVM.txtEmail, keyboardType: .emailAddress)
                    .padding(.bottom , .screenWidth * 0.07)
                
                LineSecureField(txt: $loginVM.txtPassword, title: "Password", placeholder: "Enter your password", isPassword: $loginVM.isShowPassword)
                    .padding(.bottom , .screenWidth * 0.02)
            
                Button {
                    
                } label: {
                    Text("Forgot password")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.black.opacity(0.7))
                }
                .frame(minWidth :  0 , maxWidth: .infinity , alignment: .trailing)
                .padding(.bottom , .screenWidth * 0.03)
                
                NavigationLink {
                   
                } label: {
                    Text("Log In")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .frame(minWidth : 0 , maxWidth: .infinity , minHeight: 60 , maxHeight: 60)
                        .background(Color(hex: "53B175"))
                        .cornerRadius(20)
                }
                .padding(.bottom , .screenWidth * 0.05)
                
                HStack{
                    Text("Dont have an account?")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color(hex: "181725"))
                    
                    NavigationLink {
                        SignUp()
                    } label: {
                        Text("Signup")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color(hex: "53B175"))
                    }

                    
        

                }


                
                
                Spacer()
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal , 20)
           
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Login()
        }
       
    }
}
