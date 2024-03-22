//
//  ProductDetailView.swift
//  necetar_online_grocery
//
//  Created by MACPC on 20/03/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product : Product
    
    @State private var isFavorite: Bool = false
    
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var homeVM = HomeViewModel.shared
    
//    private var isFavorite: Bool {
//           favoriteProducts.contains { $0.id == product.id }
//       }
    
    @State private var favoriteProductIds: [Int] = UserDefaults.standard.array(forKey: "FavouriteProducts") as? [Int] ?? []
    
    @State private var favoriteProducts: [Product] = {
        if let savedData = UserDefaults.standard.data(forKey: "FavouriteProducts"),
           let decodedData = try? JSONDecoder().decode([Product].self, from: savedData) {
            return decodedData
        } else {
            return []
        }
    }()

    
    var body: some View {
        ZStack{
            
            
            ScrollView{
                ZStack{
                    Rectangle()
                        .foregroundColor(Color(hex: "F2F2F2"))
                        .frame(width: .screenWidth, height: .screenWidth * 0.8)
                        .cornerRadius(30 , corner: [.bottomLeft , .bottomRight])
                    
                    if let imageUrl = URL(string: product.image) {
                                    AsyncImage(url: imageUrl) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: .screenWidth, height: .screenWidth * 0.8)
                                            .background(Color.clear)
                                    }
                               placeholder: {
                                        ProgressView()
                                    }
                                } else {
                                    Image("placeholder_image")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: .screenWidth, height: .screenWidth * 0.8)
                                }
                    
                }.frame(width: .screenWidth, height: .screenWidth * 0.8)
                
                VStack{
                    HStack{
                        Text(product.productName)
                            .foregroundColor(Color(hex: "181725"))
                            .font(.system(size: 24, weight: .bold))
                            .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                        
                        Button(action: {
                            toggleFavorite()
                        }) {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(isFavorite ? .red : .gray)
                                
                        }
                       

                        
                    }
                    .padding(.bottom , 10)
                    
                    Text("\(product.quantity)kg  , per 1kg")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color(hex: "7C7C7C"))
                        .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                    
                    HStack{
                        
                        Button {
                            homeVM.addSubQty(isAdd: false)
                        } label: {
                            Image("minus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        
                        Text("\(homeVM.qty)")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .frame(width: 45, height: 45, alignment: .center)
                            .overlay{
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black.opacity(0.4))
                            }
                        
                        Button {
                            homeVM.addSubQty(isAdd: true)
                        } label: {
                            Image("plus1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }

                        Spacer()
                        
                        Text("$\(String(format: "%.2f", product.price))")
                            .font(.system(size: 24, weight: .semibold))
                           
                    }
                    .padding(.vertical , 8)
                    Divider()
                    
                }
                .padding(.horizontal , 20)
                .padding(.vertical , 20)
                
                VStack{
                    HStack{
                        Text("Product Detail")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                        
                        Button {
                            withAnimation {
                                homeVM.showDetails()
                            }
                           
                        } label: {
                            Image(homeVM.isShowDetails ? "down" : "next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        

                        
                    }
                    if(homeVM.isShowDetails){
                        Text(product.description)
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(Color(hex: "7C7C7C"))
                            .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                            .padding(.bottom , 8)
                            
                    }
                    Divider()
                    
                    
                }
                .padding(.horizontal , 20)
                
                VStack{
                    HStack{
                        Text("Nutritions")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                        
                        Text("100gm")
                            .font(.system(size: 9, weight: .semibold))
                            .foregroundColor(Color(hex: "7C7C7C"))
                            .frame(width: 34, height: 18)
                            .background(Color.black.opacity(0.1))
                            .cornerRadius(5)
                        
                        Button {
                            withAnimation {
                                homeVM.showNutrition()
                            }
                           
                        } label: {
                            Image(homeVM.isShowNutrients ? "down" : "next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        

                        
                    }
                    if(homeVM.isShowNutrients){
                        LazyVStack{
                            ForEach(0..<5, id: \.self) { index in
                                HStack{
                                    Text("protien")
                                        .font(.system(size: 13, weight: .medium))
                                        .foregroundColor(Color(hex: "7C7C7C"))
                                        .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                                        .padding(.bottom , 8)
                                    
                                    Text("70gm")
                                        .font(.system(size: 13, weight: .semibold))
                                        .foregroundColor(Color(hex: "7C7C7C"))
                                        .padding(.bottom , 8)
                                    
                                    
                                }
                                Divider()
                            }
                            
                        }
                        .padding(.horizontal , 10)
                        
                            
                    }
                    Divider()
                    
                    
                }
                .padding(.horizontal , 20)
                
                VStack{
                    HStack{
                        Text("Review")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                        
                        HStack(spacing : 2){
                            ForEach(0..<5 , id : \.self){ index in
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.orange)
                                    .frame(width: 20, height: 14)
                                
                            }
                        }
                        
                        Button {
                            withAnimation {
                                
                            }
                           
                        } label: {
                            Image("next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        

                        
                    }
                    
                    
                    
                    
                }
                .padding(.horizontal , 20)
                
                NavigationLink {
                   
                } label: {
                    Text("Add To Basket")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .frame(minWidth : 0 , maxWidth: .infinity , minHeight: 60 , maxHeight: 60)
                        .background(Color(hex: "53B175"))
                        .cornerRadius(20)
                }
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
                    
                    Button {
                       
                    } label: {
                        Image("share")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }

                }
                Spacer()
            }
            .padding(.top , .topInsets)
            .padding(.horizontal , 20)
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .onAppear {
                updateFavoriteStatus()
            }
    }
    
    
    
    private func updateFavoriteStatus() {
        // Assuming the favorite products are stored as an array of IDs in UserDefaults
        let favoriteProductIds: [Int] = UserDefaults.standard.array(forKey: "FavouriteProducts") as? [Int] ?? []
        self.isFavorite = favoriteProductIds.contains(product.id)
    }
    
    private func toggleFavorite() {
        var favoriteProductIds: [Int] = UserDefaults.standard.array(forKey: "FavouriteProducts") as? [Int] ?? []

        if isFavorite {
            // Remove from favorites
            favoriteProductIds.removeAll { $0 == product.id }
            isFavorite = false
            print("Removed : \(favoriteProductIds)")
        } else {
            // Add to favorites
            favoriteProductIds.append(product.id)
            isFavorite = true
            print("Added : \(favoriteProductIds)")
        }

        // Save updated favorites back to UserDefaults
        UserDefaults.standard.set(favoriteProductIds, forKey: "FavouriteProducts")
    }



}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProduct = Product(id: 1, productName: "Apple", description: "Description", quantity: 10, price: 5.99, image: "banana", categoryId: 1)
        @State var isFavorite: Bool = false
         return ProductDetailView(product: sampleProduct)
    }
}
