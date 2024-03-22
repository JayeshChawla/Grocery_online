//
//  FavouriteRow.swift
//  necetar_online_grocery
//
//  Created by MACPC on 21/03/24.
//

import SwiftUI

struct FavouriteRow: View {
    var product : Product
    var body: some View {
        VStack{
            HStack (spacing : 15){
                if let imageUrl = URL(string: product.image) {
                                AsyncImage(url: imageUrl) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                } placeholder: {
                                    ProgressView()
                                }
                            } else {
                                Image("placeholder_image")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 80)
                            }
                
                VStack(spacing : 4){
                    Text(product.productName)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                        .frame(minWidth : 0 ,maxWidth: .infinity , alignment: .leading)
                    
                    Text("$\(String(format: "%.2f", product.price))")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color(hex: "7C7C7C"))
                        .frame(minWidth : 0 ,maxWidth: .infinity , alignment: .leading)
                }
                Text("$\(product.price)")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)
                
                Image("next")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                
            }
        
            Divider()
        }
    }
}

struct FavouriteRow_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProduct = Product(id: 1, productName: "Apple", description: "Description", quantity: 10, price: 5.99, image: "banana", categoryId: 1)
        FavouriteRow(product: sampleProduct)
    }
}
