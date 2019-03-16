import Foundation
import UIKit

class AuthService {
    
    static let instance = AuthService()
    private init () { }

    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LoggedInKey)
        }
        set {
            defaults.set(newValue, forKey: LoggedInKey)
        }
    }
    
    var authToken: String? {
        get {
            if let apiToken = defaults.value(forKey: ApiTokenKey) as? String {
                return apiToken
            }
            return nil
        }
        set {
            defaults.set(newValue, forKey: ApiTokenKey)
        }
    }
    
    var userEmail: String? {
        get {
            return defaults.value(forKey: UserMailKey) as? String
        }
        set {
            defaults.set(newValue, forKey: UserMailKey)
        }
    }
    
    var userPhone: String? {
        get {
            return defaults.value(forKey: UserPhoneKey) as? String
        }
        set {
            defaults.set(newValue, forKey: UserPhoneKey)
        }
    }
    
    var userAdress: String? {
        get {
            return defaults.value(forKey: UserAddressKey) as? String
        }
        set {
            defaults.set(newValue, forKey: UserAddressKey)
        }
    }
    
    var userId: Int? {
        get {
            if let userID = defaults.value(forKey: UserIdKey) as? Int {
                return userID }
            return nil
        }
        set {
            defaults.set(newValue, forKey: UserIdKey)
        }
    }
    
    var userName: String? {
        get {
            return defaults.value(forKey: UserName) as? String
        }
        set {
            defaults.set(newValue, forKey: UserName)
        }
    }
    
    var userImage: String? {
        get {
            return defaults.value(forKey: UserProfileImage) as? String
        }
        set {
            defaults.set(newValue, forKey: UserProfileImage)
        }
    }
    
    
    func removeUserDefaults()  {
        isLoggedIn = false
        authToken = nil
        userEmail = nil
        userId = nil
        userName = nil
        userImage = nil

    }
    
    func restartAppAndRemoveUserDefaults() {
       removeUserDefaults()
        
        DispatchQueue.main.async {
            guard let window =  UIApplication.shared.keyWindow else { fatalError() }
            let loginViewController = LoginViewController()
            window.rootViewController = loginViewController
            UIView.transition(with: window, duration: 1.0, options: .transitionFlipFromTop, animations: nil, completion: nil)
        }

    }
}
