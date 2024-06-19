//
//  UserDataService.swift
//  QuizApp
//
//  Created by Олеся Скидан on 30.04.2024.
//

import Foundation

class UserDataService {
    static let shared = UserDataService()

    private let defaults = UserDefaults.standard
    
    private let userIDKey = K.WebView.userIDKey
    private let fullrefKey = K.WebView.fullrefKey
    
    private let appID = "f23ac11b-36cc-5432-a568-0e02b4c3d876"
    

    private init() {}

    func getUserID() -> String? {
        return defaults.string(forKey: userIDKey)
    }
    
    func setUserID(_ userID: String) {
        defaults.set(userID, forKey: userIDKey)
    }
    
    func getFullRef() -> String? {
        return defaults.string(forKey: fullrefKey)
    }
    
    func setFullRef(_ fullRef: String) {
        defaults.set(fullRef, forKey: fullrefKey)
    }
    
}

