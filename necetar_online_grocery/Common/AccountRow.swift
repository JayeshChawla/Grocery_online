//
//  AccountRow.swift
//  necetar_online_grocery
//
//  Created by MACPC on 26/03/24.
//

import SwiftUI

struct AccountRow: View {
    
    @State var title : String = "Order"
    @State var icon : String = "order"
    var body: some View {
        VStack{
            HStack(spacing : 15) {
                Image(icon)
                    .frame(width: 18, height: 20)
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(minWidth : 0 , maxWidth: .infinity , alignment: .leading)
                
                Image("next")
                    .frame(width: 18, height: 20)
            }
            .padding(20)
            Divider()
            
        }
    }
}

struct AccountRow_Previews: PreviewProvider {
    static var previews: some View {
        AccountRow()
    }
}
