//
//  MainViewModel.swift
//  necetar_online_grocery
//
//  Created by MACPC on 18/03/24.
//

import Foundation

class MainViewModel : ObservableObject{
    static var shared : MainViewModel = MainViewModel()
    
    @Published var txtUsername : String = ""
    @Published var txtEmail : String = ""
    @Published var txtPassword : String = ""
    @Published var isShowPassword : Bool = false
}
