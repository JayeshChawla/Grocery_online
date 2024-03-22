//
//  ExplorecategoryCell.swift
//  necetar_online_grocery
//
//  Created by MACPC on 22/03/24.
//

import SwiftUI

struct ExplorecategoryCell: View {
    
    var category : ExploreCategory
//    @State var color : Color = .yellow
    
    var body: some View {
        VStack{
            if let imageUrl = URL(string : category.image) {
                            AsyncImage(url: imageUrl) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 112, height: 75)
                            } placeholder: {
                                ProgressView()
                            }
                        } else {
                            Image("placeholder_image")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 112, height: 75)
                        }
            Spacer()
            
            Text(category.typeName)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(hex: "3E423F"))
//                .lineLimit(2)
                .frame(minWidth : 0 , maxWidth: .infinity , alignment: .center)
            
            Spacer()
        }
        .padding(15)
        .background(Color(hex: category.color).opacity(0.3))
        .cornerRadius(16)
        .overlay(
             RoundedRectangle(cornerRadius: 15)
                .stroke(Color(hex: category.color) , lineWidth: 1)
        )
    }
}

struct ExplorecategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        let sampleData = ExploreCategory(id: 1, typeName: "Fresh Vegetables and Fruits", image: "banana", color: "53B175")
        ExplorecategoryCell(category: sampleData)
            .previewLayout(.fixed(width:180, height: 230))
            .padding(20)
    }
}
