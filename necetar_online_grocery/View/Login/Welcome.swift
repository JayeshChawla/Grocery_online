//
//  Welcome.swift
//  necetar_online_grocery
//
//  Created by MACPC on 18/03/24.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        ZStack{
            Image("welcome")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.bottom , 5)
                
                Text("Welcome \n to our Store")
                    .foregroundColor(.white)
                    .font(.system(size: 48, weight: .semibold))
                    .multilineTextAlignment(.center)
//                    .padding(.bottom , 20)
                    
                
                Text("Get your grocery in as fast as one hour")
                    .foregroundColor(.white.opacity(0.7))
                    .font(.system(size: 16, weight: .medium))
                    .multilineTextAlignment(.center)
                    .padding(.bottom , 20)
                
                NavigationLink {
                    SignIn()
                } label: {
                    Text("Get Started")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .frame(minWidth : 0 , maxWidth: .infinity , minHeight: 60 , maxHeight: 60)
                        .background(Color(hex: "53B175"))
                        .cornerRadius(20)
                }

                
                
                Spacer().frame(height : 60)
                
                
            }
            .padding(.horizontal , 20)
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Welcome()
        }
        
    }
}
