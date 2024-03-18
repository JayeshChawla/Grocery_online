//
//  Login.swift
//  necetar_online_grocery
//
//  Created by MACPC on 18/03/24.
//

import SwiftUI

struct  SignIn: View {
    
    @State var number : String = ""
    var body: some View {
        ZStack(){
            Image("bottom")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack {
                Image("mask")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenWidth)
                
                
                Spacer()
            }
            ScrollView{
                VStack (alignment : .leading){
                    Text("Get your groceries \n with nectar")
                        .font(.system(size: 26, weight: .semibold))
                        .multilineTextAlignment(.leading)
                        .padding(.bottom , 25)
                    
                    
                    HStack{
                        Button {
                            
                        } label: {
                            Image("")
                            
                            Text("+91")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.black)
                        }
                        
                        TextField("Enter Mobile", text: $number)
                            .frame(minWidth : 0 , maxWidth: .infinity)

                    }
                    
                    NavigationLink {
                        Login()
                    } label: {
                        Text("Continue with Email SignIn")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth : 0 , maxWidth: .infinity , minHeight: 60 , maxHeight: 60)
                    .background(Color(hex: "5383EC"))
                    .cornerRadius(20)
                    .padding(.bottom, 10)
                    
                    NavigationLink {
                       SignUp()
                    } label: {
                        Text("Continue with Email SignUP")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth : 0 , maxWidth: .infinity , minHeight: 60 , maxHeight: 60)
                    .background(Color(hex: "53B175"))
                    .cornerRadius(20)
                    .padding(.bottom, 10)

                    Divider()
                        .padding(.bottom , 25)
                    
                    Text("or connect with social media")
                        .foregroundColor(.black.opacity(0.7))
                        .font(.system(size: 14, weight: .semibold))
                        .frame(minWidth : 0 , maxWidth: .infinity ,alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding(.bottom , 25)
                    
                    Button {
                        
                    } label: {
                        Image("google")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(.trailing)
                        
                        Text("Continue with Google")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .multilineTextAlignment(.center)
                            
                    }
                    .frame(minWidth : 0 , maxWidth: .infinity , minHeight: 60 , maxHeight: 60)
                    .background(Color(hex: "5383EC"))
                    .cornerRadius(20)
                    .padding(.bottom, 10)
                    
                    Button {
                        
                    } label: {
                        
                        Image("facebook")
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(.trailing)
                        Text("Continie with Facebook")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .multilineTextAlignment(.center)
                         
                    }
                    .frame(minWidth : 0 , maxWidth: .infinity , minHeight: 60 , maxHeight: 60)
                    .background(Color(hex: "4A66AC"))
                    .cornerRadius(20)

                    
                    
                }
                .padding(.horizontal , 20)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .topInsets + .screenWidth * 0.6 )
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SignIn()
        }
      
    }
}
