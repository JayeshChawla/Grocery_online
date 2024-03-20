//
//  HomeViewModel.swift
//  necetar_online_grocery
//
//  Created by MACPC on 19/03/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    static var shared : HomeViewModel = HomeViewModel()
    
    @Published var selectedTab : Int = 0
    @Published var searchtxt : String = ""
    @Published var productResponse : ProductsResponse?
    
    @Published var isShowDetails : Bool = false
    @Published var isShowNutrients : Bool = false
    @Published var qty : Int = 1
    
    func showDetails(){
        isShowDetails = !isShowDetails
    }
    func showNutrition(){
        isShowNutrients = !isShowNutrients
    }
    func addSubQty(isAdd : Bool = true){
        if(isAdd){
            qty += 1
            if(qty > 99){
                qty = 99
            }
        }else{
            qty -= 1
            if(qty < 1){
                qty = 1
            }
        }
    }
    
    func fetch (){
            guard let url = URL(string: "http://192.168.1.3:8000/api/products-category/1") else {
                print("Invalid Url")
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error fetching data: \(error)")
                    return
                }
                
                guard let data = data else {
                    print("No data received")
                    return
                }
                
                // Print the JSON data received from the API
                if let jsonString = String(data: data, encoding: .utf8) {
//                    print("JSON Data: \(jsonString)")
                }
                
                // Decode JSON
                do {
                    let productResponse = try JSONDecoder().decode(ProductsResponse.self, from: data) // Change here
                    DispatchQueue.main.async {
                        self.productResponse = productResponse // Change here
                    }
                } catch {
                    print("Error in decoding JSON: \(error)")
                }
            }
            task.resume()
        }
}

