//
//  UserModel.swift
//  PhotoSearcher
//
//  Created by Alex Pupko on 15.01.22.
//

import Foundation

extension UserDefaults {
    private static let favoritesImageKey = "kFavorites"
    private static let favoritesUserNameKey = "nFavorites"
    
    private static var favoritesImages: [String] {
        get {
            if let strings = UserDefaults.standard.object(forKey: favoritesImageKey) as? [String] {
                return strings
            } else {
                return []
            }
        }
        set {
            standard.set(newValue, forKey: favoritesImageKey)
        }
    }
    
    private static var favoritesUserName: [String] {
        get {
            if let stringsNames = UserDefaults.standard.object(forKey: favoritesUserNameKey) as? [String] {
                return stringsNames
            } else {
                return []
            }
        }
        set {
            standard.set(newValue, forKey: favoritesUserNameKey)
        }
    }
    
    class func getFavoritesImages() -> [String] {
        return UserDefaults.favoritesImages
        
    }
    class func getFavoritesNames() -> [String] {
        return UserDefaults.favoritesUserName
        
    }
    
    class func addToFavoritesImage(urlString: String) {
        var urls = UserDefaults.favoritesImages
        if !urls.contains(where: {$0 == urlString }) {
            urls.append(urlString)
            UserDefaults.favoritesImages = urls
        }
    }

    class func addToFavoritesName(userName: String) {
            var usrnm = UserDefaults.favoritesUserName
            if !usrnm.contains(where: {$0 == userName }) {
                usrnm.append(userName)
                UserDefaults.favoritesUserName = usrnm
            }
        }
    
    
    class func deleteFromFavorites(urlString: String) {
        var urls = UserDefaults.favoritesImages
        urls.removeAll(where: {$0 == urlString})
        UserDefaults.favoritesImages = urls
    }
    
    class func deleteNamesFromFavorites(userName: String) {
        var usrnm = UserDefaults.favoritesUserName
        usrnm.removeAll(where: {$0 == userName})
        UserDefaults.favoritesUserName = usrnm
    }
    
    class func cleanFavorites() {
        UserDefaults.favoritesImages = []
        UserDefaults.favoritesUserName = []
    }
}

