//
//  CategoryCell.swift
//  necetar_online_grocery
//
//  Created by MACPC on 19/03/24.
//

import SwiftUI

struct CategoryCell: View {
    
    var didAddCart : (()->())?
    @State var color : Color = .yellow
    
    var body: some View {
        HStack{
            Image("pulses")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 80)
            
            Text("Pulses")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color(hex: "3E423F"))
            
            
        }
        .padding(15)
        .frame(width : 249 , height: 105)
        .background(color.opacity(0.3))
        .cornerRadius(16)
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell()
    }
}
