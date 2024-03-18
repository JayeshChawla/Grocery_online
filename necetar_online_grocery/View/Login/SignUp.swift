//
//  SignUp.swift
//  necetar_online_grocery
//
//  Created by MACPC on 18/03/24.
//

import SwiftUI

struct SignUp: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var signupVM = MainViewModel.shared;
    
    var body: some View {
        ZStack{
            Image("full")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            ScrollView{
                VStack{
                    Image("carrot")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding(.bottom , .screenWidth * 0.1)
                    
                    Text("Sign Up")
                        .foregroundColor(.black)
                        .font(.system(size: 26, weight: .semibold))
                        .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                        .padding(.bottom , 5)
                    
                    Text("Enter your credential to continue")
                        .foregroundColor(Color(hex: "7C7C7C"))
                        .font(.system(size: 16, weight: .medium))
                        .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                        .padding(.bottom , .screenWidth * 0.1)
                    
                    LineTextField(title: "Username", placeholder: "Enter your username", txt: $signupVM.txtUsername)
                    
                    LineTextField(title: "Email", placeholder: "Enter your email", txt: $signupVM.txtEmail, keyboardType: .emailAddress)
                        .padding(.bottom , .screenWidth * 0.07)
                    
                    LineSecureField(txt: $signupVM.txtPassword, title: "Password", placeholder: "Enter your password", isPassword: $signupVM.isShowPassword)
                        .padding(.bottom , .screenWidth * 0.02)
                
                    VStack {
                        HStack{
                            Text("By continuing you agree to our ")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Color(hex: "7C7C7C"))
    //                            .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                            Text("Terms of service")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Color(hex: "53B175"))
                        }
                        .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                        
                        HStack{
                            Text("and")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Color(hex: "7C7C7C"))
    //                            .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                            Text("Privacy Policy")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Color(hex: "53B175"))
                        }
                        .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                    
                    }.padding(.bottom , .screenWidth * 0.03)

                    
                    NavigationLink {
                       
                    } label: {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .frame(minWidth : 0 , maxWidth: .infinity , minHeight: 60 , maxHeight: 60)
                            .background(Color(hex: "53B175"))
                            .cornerRadius(20)
                    }
                    .padding(.bottom , .screenWidth * 0.05)
                    
                    HStack{
                        Text("Already have an account?")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color(hex: "181725"))
                        
                        NavigationLink(destination: {Login()}) {
                            Text("Login")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Color(hex: "53B175"))
                        }
                        

                        
            

                    }


                    
                    
                    Spacer()
                }
                .padding(.top, .topInsets + 64)
                .padding(.horizontal , 20)
            }
            
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
            
            
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
