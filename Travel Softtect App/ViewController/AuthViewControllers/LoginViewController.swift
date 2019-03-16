//
//  ViewController.swift
//  El-Mutamer
//
//  Created by Youssef on 12/16/18.
//  Copyright © 2018 ITGeeKs. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let backImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "flashImg")
        return img
    }()
    let logoImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "logo")
        img.contentMode = .scaleToFill
        return img
    }()
    let mailTxt: UITextField = {
        let txt = UITextField()
        txt.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [.foregroundColor: #colorLiteral(red: 0.1677345634, green: 0.6112251282, blue: 0.8091259599, alpha: 1)])
        txt.font = .CairoSemiBold(of: 16)
        txt.withImage(direction: .Right, image: .init(imageLiteralResourceName: "mail"), colorSeparator: .clear, colorBorder: .clear)
        txt.textAlignment = .center
        txt.backgroundColor = .clear
        txt.layer.borderColor = #colorLiteral(red: 0.1677345634, green: 0.6112251282, blue: 0.8091259599, alpha: 1)
        txt.layer.borderWidth = 0.5
        txt.backgroundColor = .clear
        return txt
    }()
    let passTxt: UITextField = {
        let txt = UITextField()
        txt.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.foregroundColor: #colorLiteral(red: 0.1677345634, green: 0.6112251282, blue: 0.8091259599, alpha: 1)])
        txt.font = .CairoSemiBold(of: 16)
        txt.withImage(direction: .Right, image: .init(imageLiteralResourceName: "password"), colorSeparator: .clear, colorBorder: .clear)
        txt.textAlignment = .center
        txt.backgroundColor = .clear
        txt.layer.borderColor = #colorLiteral(red: 0.1677345634, green: 0.6112251282, blue: 0.8091259599, alpha: 1)
        txt.layer.borderWidth = 0.5
        txt.isSecureTextEntry = true
        return txt
    }()
    let loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 0.9426948428, green: 0.2886400223, blue: 0.3140003979, alpha: 1)
        btn.setTitle("Login", for: .normal)
        btn.titleLabel?.font = .CairoBold(of: 15)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    let registerButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.setTitleColor(#colorLiteral(red: 0.966343224, green: 0.323245436, blue: 0.1909982264, alpha: 1), for: .normal)
        btn.titleLabel?.font = .CairoBold(of: 15)
        btn.setTitle("Sign UP", for: .normal)
        return btn
    }()
    let forgetButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.setTitleColor(#colorLiteral(red: 0.03137254902, green: 0.01445074473, blue: 0.4964898229, alpha: 1), for: .normal)
        btn.titleLabel?.font = .CairoBold(of: 15)
        btn.setTitle("Forget Password", for: .normal)
        return btn
    }()
    
    let googleButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "googlePlus"), for: .normal)
        return btn
    }()
    let facebookButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "facebook"), for: .normal)
        return btn
    }()
    let linkedinButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "linkedin"), for: .normal)
        return btn
    }()
    let twitterButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "twitter"), for: .normal)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(backImage)
        backImage.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero, size: .zero)
        
        view.addSubview(logoImg)
        logoImg.anchorWithCenterXY(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil, centerX: view.centerXAnchor, centerY: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: CGSize.init(width: 180, height: 80))
        
        let stack = UIStackView(arrangedSubviews: [mailTxt, passTxt])
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.axis = .vertical
        view.addSubview(stack)
        stack.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: nil, centerX: view.centerXAnchor, centerY: view.centerYAnchor, padding: .zero, size: .init(width: view.frame.width * 0.8, height: 70))
        
        view.addSubview(loginButton)
        loginButton.anchorWithCenterXY(top: stack.bottomAnchor, leading: stack.leadingAnchor, bottom: nil, trailing: stack.trailingAnchor, centerX: stack.centerXAnchor, centerY: nil, padding: .init(top: 15, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 30))
        view.addSubview(forgetButton)
        forgetButton.anchorWithCenterXY(top: loginButton.bottomAnchor, leading: stack.leadingAnchor, bottom: nil, trailing: nil, centerX: nil, centerY: nil, padding: .init(top: 6, left: 0, bottom: 0, right: 0), size: .init(width: 120, height: 30))
        view.addSubview(registerButton)
        registerButton.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: stack.trailingAnchor, centerX: nil, centerY: forgetButton.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 60, height: 30))
        
        let lable = UILabel()
        lable.font = .CairoBold(of: 15)
        lable.text = "Sign In With"
        lable.textColor = .black
        lable.textAlignment = .center
        view.addSubview(lable)
        lable.anchorWithCenterXY(top: registerButton.bottomAnchor, leading: stack.leadingAnchor, bottom: nil, trailing: stack.trailingAnchor, centerX: stack.centerXAnchor, centerY: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 20))
        
        let stackTwo = UIStackView(arrangedSubviews: [googleButton, facebookButton, linkedinButton, twitterButton])
        stackTwo.distribution = .fillEqually
        stackTwo.spacing = 10
        stackTwo.axis = .horizontal
        view.addSubview(stackTwo)
        stackTwo.anchorWithCenterXY(top: lable.bottomAnchor, leading: nil, bottom: nil, trailing: nil, centerX: view.centerXAnchor, centerY: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width * 0.5, height: 35))
        
        
        
        
        
        
        
        
        
        registerButton.addTarget(self, action: #selector(showRegisterViewController), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    @objc private func showRegisterViewController() {
//        let registerViewController = RegisterViewController()
       // present(registerViewController, animated: true, completion: nil)
    }
    
    @objc private func loginUser() {
        let homeTabBarController = HomeTabBarController()
        present(homeTabBarController, animated: true, completion: nil)
        guard let mail = mailTxt.text else { return }
        guard let pass = passTxt.text else { return }
//        print(url)
        
        
        
    }
}

