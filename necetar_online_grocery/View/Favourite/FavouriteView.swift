//
//  FavouriteView.swift
//  necetar_online_grocery
//
//  Created by MACPC on 21/03/24.
//

import SwiftUI

struct FavouriteView: View {
    
    
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        ZStack{
            
            
            ScrollView{
                LazyVStack{
                    ForEach(homeVM.productResponse?.data ?? [], id: \.self) { product in
                       
                             FavouriteRow(product: product)
                            
                    }
                    .padding(20)
                }
            }
            .padding(.top , .topInsets + 46)
            
            
            VStack{
                HStack{
                    Spacer()
                    Text("Favourite")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                        .frame(height : 46)
                    
                    Spacer()
                    
                }
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

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        
        FavouriteView()
    }
}
