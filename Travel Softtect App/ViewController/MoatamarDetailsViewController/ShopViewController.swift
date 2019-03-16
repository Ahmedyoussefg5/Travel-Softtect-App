//
//  SearchViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/22/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit
import Kingfisher

class ShopViewController: UIViewController {
    
    var selectedTap = 0
    
    let cellImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.contentMode = .scaleToFill
        return imgV
    }()
    
    let cellSubName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.CairoBold(of: 10)
        lbl.numberOfLines = 1
        lbl.textAlignment = .right
        lbl.textColor = #colorLiteral(red: 0.1568416357, green: 0.1568752229, blue: 0.1568368971, alpha: 1)
        return lbl
    }()
    
    let cellName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.CairoBold(of: 14)
        lbl.numberOfLines = 1
        lbl.textAlignment = .right
        lbl.textColor = .black
        return lbl
    }()
    
    let companyImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "company namecompany name")
        imgV.contentMode = .scaleToFill
        return imgV
    }()
    lazy var companyNameLable: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.CairoSemiBold(of: 10)
        lbl.text = "المصدي اليوم"
        lbl.numberOfLines = 1
        lbl.textAlignment = .right
        lbl.textColor = #colorLiteral(red: 0.3215311766, green: 0.321590811, blue: 0.3215227723, alpha: 1)
        return lbl
    }()
    
    let dateImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "calendercalender")
        imgV.contentMode = .scaleToFill
        return imgV
    }()
    lazy var companydateLable: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.CairoSemiBold(of: 10)
        lbl.numberOfLines = 1
        lbl.textAlignment = .right
        lbl.textColor = #colorLiteral(red: 0.3215311766, green: 0.321590811, blue: 0.3215227723, alpha: 1)
        return lbl
    }()
    
    let commentsImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "commentcomment")
        imgV.contentMode = .scaleToFill
        return imgV
    }()
    lazy var commentsLable: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.CairoSemiBold(of: 10)
        lbl.text = "777"
        lbl.numberOfLines = 1
        lbl.textAlignment = .right
        lbl.textColor = #colorLiteral(red: 0.3215311766, green: 0.321590811, blue: 0.3215227723, alpha: 1)
        return lbl
    }()
    
    let locationImgView: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "loci")
        imgV.contentMode = .scaleToFill
        return imgV
    }()
    lazy var locationLable: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.CairoSemiBold(of: 8)
        lbl.text = "777"
        lbl.numberOfLines = 2
        lbl.textAlignment = .right
        lbl.textColor = #colorLiteral(red: 0.3215311766, green: 0.321590811, blue: 0.3215227723, alpha: 1)
        return lbl
    }()
    
    let likesImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "likelike")
        imgV.contentMode = .scaleToFill
        return imgV
    }()
    lazy var likesLable: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.CairoSemiBold(of: 10)
        lbl.text = "128"
        lbl.numberOfLines = 1
        lbl.textAlignment = .right
        lbl.textColor = #colorLiteral(red: 0.3215311766, green: 0.321590811, blue: 0.3215227723, alpha: 1)
        return lbl
    }()
    
    let infoButton: UIButton = {
        let txt = UIButton()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 0
        txt.layer.cornerRadius = 0.0
        txt.backgroundColor = .white
        txt.setTitle("التفاصيل", for: .normal)
        txt.titleLabel?.font = UIFont.CairoSemiBold(of: 11)
        txt.setTitleColor(.black, for: .normal)
        txt.contentHorizontalAlignment = .center
        txt.tag = 1
        txt.addTarget(self, action: #selector(handleMenuBarTap(_:)), for: .touchUpInside)
        return txt
    }()
    
    let galaryButton: UIButton = {
        let txt = UIButton()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 0
        txt.layer.cornerRadius = 0.0
        txt.backgroundColor = .white
        txt.setTitle("معرض الصور", for: .normal)
        txt.titleLabel?.font = UIFont.CairoSemiBold(of: 10)
        txt.setTitleColor(.black, for: .normal)
        txt.contentHorizontalAlignment = .center
        txt.tag = 2
        txt.addTarget(self, action: #selector(handleMenuBarTap(_:)), for: .touchUpInside)
        return txt
    }()
    
    let tableButton: UIButton = {
        let txt = UIButton()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 0
        txt.backgroundColor = .white
        txt.setTitle("الجدول", for: .normal)
        txt.titleLabel?.font = UIFont.CairoSemiBold(of: 11)
        txt.setTitleColor(.black, for: .normal)
        txt.contentHorizontalAlignment = .center
        txt.tag = 3
        txt.addTarget(self, action: #selector(handleMenuBarTap(_:)), for: .touchUpInside)
        return txt
    }()
    
    let sponsersButton: UIButton = {
        let txt = UIButton()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 0
        txt.backgroundColor = .white
        txt.setTitle("الرعاه", for: .normal)
        txt.titleLabel?.font = UIFont.CairoSemiBold(of: 11)
        txt.setTitleColor(.black, for: .normal)
        txt.contentHorizontalAlignment = .center
        txt.tag = 4
        txt.addTarget(self, action: #selector(handleMenuBarTap(_:)), for: .touchUpInside)
        return txt
    }()
    
    let mapButton: UIButton = {
        let txt = UIButton()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 0
        txt.backgroundColor = .white
        txt.setTitle("الخريطة", for: .normal)
        txt.titleLabel?.font = UIFont.CairoSemiBold(of: 11)
        txt.setTitleColor(.black, for: .normal)
        txt.contentHorizontalAlignment = .center
        txt.tag = 5
        txt.addTarget(self, action: #selector(handleMenuBarTap(_:)), for: .touchUpInside)
        return txt
    }()
    
    let childViewControllerContainer: UIView = {
        let lable = UIView()
        lable.backgroundColor = .white
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    var type = false // if menu >> true
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        menuButtonsArray = [infoButton, galaryButton, tableButton, sponsersButton, mapButton]
        setupLayout()
        setupButtons()
        
        handleMenuBarTap(menuButtonsArray[0])
    }
    
    fileprivate func setupLayout() {
        view.addSubview(cellImageView)
        cellImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: 0, height: view.frame.height * 0.3))
        
        view.addSubview(cellSubName)
        cellSubName.anchor(top: cellImageView.bottomAnchor, leading: nil, bottom: nil, trailing: cellImageView.trailingAnchor, padding: .init(top: 3, left: 0, bottom: 20, right: 5), size: .init(width: view.frame.width * 0.3, height: 15))
        
        view.addSubview(likesImageView)
        likesImageView.anchorWithCenterXY(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: nil, centerX: nil, centerY: cellSubName.centerYAnchor, padding: .init(top: 0, left: 5, bottom: 0, right: 0),size: .init(width: 15, height: 15))
        
        view.addSubview(likesLable)
        likesLable.anchorWithCenterXY(top: nil, leading: likesImageView.trailingAnchor, bottom: nil, trailing: nil, centerX: nil, centerY: cellSubName.centerYAnchor, padding: .init(top: 0, left: 5, bottom: 0, right: 0),size: .init(width: view.frame.width * 0.08, height: 0))
        
        view.addSubview(commentsImageView)
        commentsImageView.anchorWithCenterXY(top: nil, leading: likesLable.trailingAnchor, bottom: nil, trailing: nil, centerX: nil, centerY: cellSubName.centerYAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 0),size: .init(width: 15, height: 15))
        
        view.addSubview(commentsLable)
        commentsLable.anchorWithCenterXY(top: nil, leading: commentsImageView.trailingAnchor, bottom: nil, trailing: nil, centerX: nil, centerY: cellSubName.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 3),size: .init(width: view.frame.width * 0.08, height: 0))
        
        view.addSubview(cellName)
        cellName.anchor(top: cellSubName.bottomAnchor, leading: nil, bottom: nil, trailing: cellImageView.trailingAnchor, padding: .init(top: 3, left: 0, bottom: 20, right: 0), size: .init(width: view.frame.width, height: 15))
        
        view.addSubview(companyImageView)
        companyImageView.anchor(top: cellName.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 7, left: 0, bottom: 0, right: 3), size: .init(width: 15, height: 15))
        
        view.addSubview(companyNameLable)
        companyNameLable.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: companyImageView.leadingAnchor, centerX: nil, centerY: companyImageView.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 3),size: .init(width: view.frame.width * 0.25, height: 0))
        
        view.addSubview(dateImageView)
        dateImageView.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: companyNameLable.leadingAnchor, centerX: nil, centerY: companyImageView.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 3),size: .init(width: 15, height: 15))
        
        view.addSubview(companydateLable)
        companydateLable.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: dateImageView.leadingAnchor, centerX: nil, centerY: companyImageView.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 3),size: .init(width: view.frame.width * 0.2, height: 0))
        
        view.addSubview(locationImgView)
        locationImgView.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: companydateLable.leadingAnchor, centerX: nil, centerY: companyImageView.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 9),size: .init(width: 15, height: 15))
        
        view.addSubview(locationLable)
        locationLable.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: locationImgView.leadingAnchor, centerX: nil, centerY: companyImageView.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 3),size: .init(width: view.frame.width * 0.15, height: 0))
    }
    
    var menuButtonsArray = [UIButton]()
    private func setupButtons () {
        
        let stackView = UIStackView(arrangedSubviews: menuButtonsArray.reversed())
        
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.axis = .horizontal
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackView.topAnchor.constraint(equalTo: locationLable.bottomAnchor, constant: 5),
            stackView.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        view.addSubview(childViewControllerContainer)
        NSLayoutConstraint.activate([
            childViewControllerContainer.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            childViewControllerContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            childViewControllerContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            childViewControllerContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        //
        //        handleInfoTapped()
    }
    
    fileprivate func updateView() {
        
    }
    
    
    @objc func handleMenuBarTap(_ sender: UIButton) {
        if selectedTap != sender.tag {
            selectedTap = sender.tag
            menuButtonsArray.forEach { (button) in
                if button != sender {
                    button.backgroundColor = .white
                }
            }
            sender.backgroundColor = #colorLiteral(red: 0.878074348, green: 0.2536863685, blue: 0.2426855266, alpha: 1)
        }
    }
    
    func toAddChildViewController(childViewController: UIViewController)
    {
        toRemoveChildViewController()
        
        addChild(childViewController)
        self.childViewControllerContainer.addSubview(childViewController.view)
        childViewController.view.frame = childViewControllerContainer.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParent: self)
    }
    func toRemoveChildViewController()
    {
        if self.children.count > 0 {
            let viewControllers:[UIViewController] = self.children
            for viewContoller in viewControllers{
                viewContoller.willMove(toParent: nil)
                viewContoller.view.removeFromSuperview()
                viewContoller.removeFromParent()
            } }
    }
}
