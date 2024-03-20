//
//  HomeView.swift
//  necetar_online_grocery
//
//  Created by MACPC on 19/03/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    Image("carrot")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    
                    HStack{
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 18)
                        
                        Text("Dhaka , Banssre")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color(hex: "4C4F4D"))
                        
                        
                    }
                    SearchTextField(placeholder: "Search Store", txt: $homeVM.searchtxt)
                        .padding(.horizontal , 20)
                        .padding(.vertical , 10)
                }
                .padding(.top , .topInsets)
                
                Image("banner")
                    .resizable()
                    .scaledToFill()
                    .frame(height : 115)
                    .padding(.horizontal , 20)
                
                SectionTitleAll(title: "Exclusive Offer", titleall: "See all"){
                    
                }
                .padding(.horizontal , 20)
                
                if let products = homeVM.productResponse?.data{
                ScrollView(.horizontal , showsIndicators: false){
                    LazyHStack(spacing : 15){
                        ForEach(products, id: \.id) { product in
                            ProductCell(product: product) {
                                
                            }
                        }
                    }
                    .padding(.horizontal , 20)
                    .padding(.vertical , 4)
                }
            }
                
                SectionTitleAll(title: "Best Selling", titleall: "See all"){
                    
                }
                .padding(.horizontal , 20)
                
                if let products = homeVM.productResponse?.data{
                ScrollView(.horizontal , showsIndicators: false){
                    LazyHStack(spacing : 15){
                        ForEach(products, id: \.id) { product in
                            ProductCell(product: product) {

                            }
                        }
                    }
                    .padding(.horizontal , 20)
                    .padding(.vertical , 4)
                }
                }
                
                SectionTitleAll(title: "Groceries", titleall: "See all"){
                    
                }
                .padding(.horizontal , 20)
                
                
                ScrollView(.horizontal , showsIndicators: false){
                    LazyHStack(spacing : 15){
                        ForEach(0..<5, id: \.self) { index in
                            CategoryCell(didAddCart: {
                                
                            }, color: Color(hex: "F8A44C"))
                        }
                    }
                    .padding(.horizontal , 20)
                    .padding(.vertical , 4)
                }
                
                if let products = homeVM.productResponse?.data{
                ScrollView(.horizontal , showsIndicators: false){
                    LazyHStack(spacing : 15){
                        ForEach(products, id: \.id) { product in
                            ProductCell(product: product) {

                            }
                        }
                    }
                    .padding(.horizontal , 20)
                    .padding(.vertical , 4)
                }
                }
//                .padding(.bottom , 15)
             
            }
            .onAppear {
              homeVM.fetch()
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
