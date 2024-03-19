//
//  MainTabVIew.swift
//  necetar_online_grocery
//
//  Created by MACPC on 19/03/24.
//

import SwiftUI

struct MainTabVIew: View {

    @StateObject var homeVM =  HomeViewModel.shared
    @State private var isShopSelected = false
    @State private var isExploreSelected = false
    
    var body: some View {
        VStack{
            
            
            TabView(selection: $homeVM.selectedTab) {
                HomeView().tag(0)
                ExploreView().tag(1)
                ExploreView().tag(2)
                ExploreView().tag(3)
                ExploreView().tag(4)
            }
            .onAppear{
                UIScrollView.appearance().isScrollEnabled = false
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onChange(of: homeVM.selectedTab) { newValue in
                debugPrint("Selected Tab : \(newValue)")
            }
            
          
            HStack{
                Button {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selectedTab = 0
                        }
                       
                    }
                    homeVM.selectedTab = 0
                    isShopSelected = true
                    isExploreSelected = false
                    debugPrint("1")
                } label: {
                    VStack{
                        Image("shop")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        
                        Text("Shop")
                            .font(.system(size: 14, weight: .semibold))
                        
                    }
                    
                }
                .foregroundColor(homeVM.selectedTab == 0 ? Color(hex: "53B175") : Color(hex: "181725"))
                .frame(minWidth : 0 , maxWidth: .infinity)
                
                Button {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selectedTab = 1
                        }
                       
                    }
                    isExploreSelected = true
                    isShopSelected = false
                } label: {
                    VStack{
                        Image("explore")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        
                        Text("Explore")
                            .font(.system(size: 14, weight: .semibold))
                        
                    }
                    
                }
                .foregroundColor(homeVM.selectedTab == 1 ? Color(hex: "53B175") : Color(hex: "181725"))
                .frame(minWidth : 0 , maxWidth: .infinity)
                
                Button {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selectedTab = 2
                        }
                       
                    }
                } label: {
                    VStack{
                        Image("cart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        
                        Text("Cart")
                            .font(.system(size: 14, weight: .semibold))
                        
                    }
                    
                }
                .foregroundColor(homeVM.selectedTab == 2 ? Color(hex: "53B175") : Color(hex: "181725"))
                .frame(minWidth : 0 , maxWidth: .infinity)
                
                Button {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selectedTab = 3
                        }
                       
                    }
                } label: {
                    VStack{
                        Image("favourie")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        
                        Text("Favourite")
                            .font(.system(size: 14, weight: .semibold))
                        
                    }
                    
                }
                .foregroundColor(homeVM.selectedTab == 3 ? Color(hex: "53B175") : Color(hex: "181725"))
                .frame(minWidth : 0 , maxWidth: .infinity)
                
                Button {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selectedTab = 4
                        }
                       
                    }
                } label: {
                    VStack{
                        Image("account")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        
                        Text("Account")
                            .font(.system(size: 14, weight: .semibold))
                        
                    }
                    
                }
                .foregroundColor(homeVM.selectedTab == 4 ? Color(hex: "53B175") : Color(hex: "181725"))
                .frame(minWidth : 0 , maxWidth: .infinity)
            }
            .padding(.top , 10)
            .padding(.bottom , .bottomInsets)
            .padding(.horizontal , 10)
            .background(.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.15), radius: 3, x: 0, y: -2)
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
     
    }
}

struct MainTabVIew_Previews: PreviewProvider {
    static var previews: some View {
        MainTabVIew()
    }
}
