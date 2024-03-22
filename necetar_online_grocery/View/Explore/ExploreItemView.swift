//
//  ExploreItemView.swift
//  necetar_online_grocery
//
//  Created by MACPC on 22/03/24.
//

import SwiftUI

struct ExploreItemView: View {
    
        var category : ExploreCategory
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var exploreitemVM = HomeViewModel.shared
    
    var coloumns = [
        GridItem(.flexible() , spacing: 25),
        GridItem(.flexible() , spacing: 25)
    ]
    var body: some View {
        ZStack{
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
                    
                    Text(category.typeName)
                        .font(.system(size: 20, weight: .bold))
                        .frame(minWidth : 0 , maxWidth: .infinity , alignment: .center)
                    
                    Button {
                       
                    } label: {
                        Image("filter")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }

                }
                if let products = exploreitemVM.productResponse?.data{
                ScrollView( showsIndicators: false){
                    LazyVGrid(columns: coloumns , spacing: 15) {
                        ForEach(products, id: \.id) { item in
                            ProductCell(width : .infinity, product: item)
                        }
                    }
//                    .padding(.horizontal , 10)
                    .padding(.vertical , 10)
                    
//
                    
                }
                }
               
            }
            .padding(.top , .topInsets)
            .padding(.horizontal , 20)
            
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .onAppear{
            exploreitemVM.fetch()
        }
    }
}

struct ExploreItemView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleData = ExploreCategory(id: 1, typeName: "Fresh Vegetables and Fruits", image: "banana", color: "53B175")
        ExploreItemView(category: sampleData)
    }
}
