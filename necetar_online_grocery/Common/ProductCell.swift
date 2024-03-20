//
//  ProductCell.swift
//  necetar_online_grocery
//
//  Created by MACPC on 19/03/24.
//

import SwiftUI


struct ProductCell: View {
    
    var product : Product
    var didAddCart : (()->())?
    var body: some View {
        
        NavigationLink {
            ProductDetailView(product: product)
        } label: {
        

        VStack{
            if let imageUrl = URL(string: product.image) {
                            AsyncImage(url: imageUrl) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 80)
                            } placeholder: {
                                ProgressView()
                            }
                        } else {
                            Image("placeholder_image")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 80)
                        }
            
            Text(product.productName)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(Color(hex: "181725"))
                .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
            
            Text("\(product.quantity)kg , \(String(format: "%.2f"))")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(hex: "7C7C7C"))
                .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
            
            Spacer()
            HStack{
                Text("$\(String(format: "%.2f", product.price))")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color(hex: "181725"))
                    .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                
                Spacer()
                
                Button {
                    didAddCart?()
                } label: {
                    Image("plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                }
                .frame(width: 40, height: 40)
                .background(Color(hex: "53B175"))
                .cornerRadius(15)
                

            }
            
        }
        .padding(15)
        .frame(width : 180 , height: 230)
        .overlay{
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black.opacity(0.2) , lineWidth: 1)
        }
    }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProduct = Product(id: 1, productName: "Apple", description: "Description", quantity: 10, price: 5.99, image: "banana", categoryId: 1)
        return ProductCell(product:sampleProduct )
            .previewLayout(.fixed(width:180, height: 230))
    }
}
