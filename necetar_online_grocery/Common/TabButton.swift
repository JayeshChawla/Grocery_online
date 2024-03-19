//
//  TabButton.swift
//  necetar_online_grocery
//
//  Created by MACPC on 19/03/24.
//

import SwiftUI

struct TabButton: View {
    @State var title: String = "Title"
    @State var icon: String = "shop"
    var isSelected: Bool = false
    var didSelect: (()->())

    var body: some View {
        Button(action: {
            debugPrint("tap")
            didSelect()
        }) {
            VStack {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
            }
        }
        .foregroundColor(isSelected ? Color(hex: "53B175") : Color(hex: "181725"))
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        TabButton{
            print("test")
        }
    }
}
