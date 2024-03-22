//
//  ExploreViewModel.swift
//  necetar_online_grocery
//
//  Created by MACPC on 22/03/24.
//

import Foundation

class ExploreViewModel : ObservableObject{
    static var shared : ExploreViewModel = ExploreViewModel()
    
    
    @Published var selectedTab : Int = 0
    @Published var searchtxt : String = ""
    @Published var exploreCategory  : ExploreResponse?
    
   
    
    
    func fetch (){
            guard let url = URL(string: "http://192.168.1.4:3000/") else {
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
                    let productResponse = try JSONDecoder().decode(ExploreResponse.self, from: data) // Change here
                    DispatchQueue.main.async {
                        self.exploreCategory = productResponse // Change here
                    }
                } catch {
                    print("Error in decoding JSON: \(error)")
                }
            }
            task.resume()
        }
}
