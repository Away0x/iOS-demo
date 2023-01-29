//
//  User.swift
//  BillAppSwiftUI
//
//  Created by 吴彤 on 2022/12/30.
//

import Foundation

class Auth : ObservableObject {
    @Published
    var authenticatedUser: UserItem? = nil
    
    func login(user: UserItem) {
        authenticatedUser = user
    }
    
    func logout() {
        authenticatedUser = nil
    }
}
