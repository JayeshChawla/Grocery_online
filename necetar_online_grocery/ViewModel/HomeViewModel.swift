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
    @Published var product : [Product] = []
    
    func fetch (){
        guard let url = URL(string: "http://192.168.1.4:8000/api/products-category/1") else {
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
                print("JSON Data: \(jsonString)")
            }
            
            // Decode JSON
            do {
                // Check if the root of JSON is an array or a dictionary
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    // If it's an array, decode it as [Response]
                    let product = try JSONDecoder().decode([Product].self, from: data)
                    DispatchQueue.main.async {
                        self.product = product
                    }
                } else if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    // If it's a dictionary, decode it as a single Response object
                    let singleResponse = try JSONDecoder().decode(Product.self, from: data)
                    DispatchQueue.main.async {
                        self.product = [singleResponse]
                    }
                }
            } catch {
                print("Error in decoding JSON: \(error)")
            }
        }
        task.resume()
    }
}

