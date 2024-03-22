//
//  ExploreView.swift
//  necetar_online_grocery
//
//  Created by MACPC on 19/03/24.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var exploreVM = ExploreViewModel.shared
    @State var txtSearch : String = ""
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    
    var coloums = [
        GridItem(.flexible() , spacing: 15),
        GridItem(.flexible() , spacing: 15)
    ]
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    Text("Find Productds")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                        .frame(height : 46)
                    
                    Spacer()
                    
                }
                .padding(.top , .topInsets)
                
                SearchTextField(placeholder: "Search Store", txt: $txtSearch)
                    .padding(.horizontal , 20)
                    .padding(.bottom ,4)
                
                if let products = exploreVM.exploreCategory?.data{
                ScrollView{
                    LazyVGrid(columns: coloums , spacing: 20) {
                        ForEach(products, id: \.id) { Categoreis in
                            NavigationLink {
                                ExploreItemView(category: Categoreis)
                            } label: {
                                ExplorecategoryCell(category: Categoreis )
                                    .aspectRatio(0.95 , contentMode: .fill)
                            }

                           
                        }
                    }
                    .padding(.horizontal , 20)
                    .padding(.vertical  , 10)
                    .padding(.bottom , .bottomInsets + 60)
                }
                }
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .onAppear{
            exploreVM.fetch()
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
