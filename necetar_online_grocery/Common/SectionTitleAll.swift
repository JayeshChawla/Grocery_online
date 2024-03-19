//
//  SectionTitleAll.swift
//  necetar_online_grocery
//
//  Created by MACPC on 19/03/24.
//

import SwiftUI

struct SectionTitleAll: View {
    
    @State var title : String = "Title"
    @State var titleall : String = "View all"
    var didTap : (()->())?
    
    var body: some View {
        HStack{
            Text(title)
                .font(.system(size: 24, weight: .semibold))
//                .foregroundColor(Color("181725"))
            
            Spacer()
            Text(titleall)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(hex: "53B175"))
        }
        .frame(height : 40)
    }
}

struct SectionTitleAll_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitleAll()
            .padding(20)
    }
}
