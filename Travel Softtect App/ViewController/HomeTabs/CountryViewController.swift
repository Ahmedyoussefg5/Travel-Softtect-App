//
//  ViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/21/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit
//import SideMenu

class CountryViewController: UIViewController {
    let settingsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.addButtomView(color: #colorLiteral(red: 0.2198592424, green: 0.6271147728, blue: 0.8121930957, alpha: 1))
        btn.setTitle("Display Settings", for: .normal)
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.CairoSemiBold(of: 13)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(handleShowingSettingsView), for: .touchUpInside)
        return btn
    }()
    @objc func handleShowingSettingsView() {
        UIView.transition(with: barView, duration: 0.5, options: UIView.AnimationOptions.transitionCurlDown, animations: {
            self.barView.isHidden ? (self.barView.isHidden = false) : (self.barView.isHidden = true)
        }, completion: nil)
    }
    
    let sortButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sort", for: .normal)
        btn.backgroundColor = .white
        btn.titleLabel?.font = .CairoSemiBold(of: 13)
        btn.setTitleColor(.black, for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 18, bottom: 10, right: 18)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
        btn.setImage(UIImage(imageLiteralResourceName: "sort"), for: .normal)
        return btn
    }()
    let filterButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Filter", for: .normal)
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.CairoSemiBold(of: 13)
        btn.setTitleColor(.black, for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 18, bottom: 10, right: 18)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
        btn.setImage(UIImage(imageLiteralResourceName: "filter"), for: .normal)
        return btn
    }()
    let mapButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Map", for: .normal)
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.CairoSemiBold(of: 13)
        btn.setTitleColor(.black, for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 18, bottom: 10, right: 18)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
        btn.setImage(UIImage(imageLiteralResourceName: "location2"), for: .normal)
        return btn
    }()
    let searchButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Search", for: .normal)
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.CairoSemiBold(of: 13)
        btn.setTitleColor(.black, for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 18, bottom: 10, right: 18)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
        btn.setImage(UIImage(imageLiteralResourceName: "search2"), for: .normal)
        return btn
    }()
    
    
    
    
    let locationButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.addButtomView(color: #colorLiteral(red: 0.8199338913, green: 0.515894115, blue: 0.1775934994, alpha: 1))
        btn.backgroundColor = .white
        btn.setImage(UIImage(imageLiteralResourceName: "location2").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 9, left: 9, bottom: 9, right: 9)
//        btn.setBackgroundImage(UIImage(imageLiteralResourceName: "flights"), for: .normal)
        return btn
    }()
    
    let closeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(imageLiteralResourceName: "group9"), for: .normal)
        btn.addTarget(self, action: #selector(dismissMe), for: .touchUpInside)
        return btn
    }()
    lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collV.backgroundColor = .white
        collV.register(CountryTableViewCell.self, forCellWithReuseIdentifier: sliderCellIdentifier)
        collV.delegate = self
        collV.dataSource = self
        return collV
    }()
    let barView = UIView()
    
    let sliderCellIdentifier = "mainCountryCollectionView"

    override func loadView() {
        super.loadView()
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9998950362, green: 1, blue: 0.9998714328, alpha: 1)
        barView.isHidden = true
    }
    
    fileprivate func setupView() {
        let topImage: UIImageView = {
            let img = UIImageView(image: UIImage(imageLiteralResourceName: "HomeBg"))
            img.clipsToBounds = true
            return img
        }()
        let countryLable: UILabel = {
            let lable = UILabel()
            lable.textColor = .white
            lable.font = .CairoBold(of: 20)
            let title = "Egypt Egypt"
            lable.textAlignment = .left
            lable.text = title
            lable.makeOutLine(oulineColor: .black, foregroundColor: .white)

            return lable
        }()

        view.addSubview(topImage)
        topImage.anchorWithCenterXY(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil, centerX: view.centerXAnchor, centerY: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: view.frame.height * 0.3))
        view.addSubview(closeButton)
        closeButton.anchorWithCenterXY(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, centerX: nil, centerY: nil, padding: .init(top: 20, left: 10, bottom: 0, right: 0), size: .init(width: 20, height: 30))
        view.addSubview(settingsButton)
        settingsButton.anchor(top: nil, leading: topImage.leadingAnchor, bottom: topImage.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 10, bottom: 5, right: 0), size: CGSize(width: 110, height: 30))
        view.addSubview(locationButton)
        locationButton.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: view.trailingAnchor, centerX: nil, centerY: settingsButton.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10), size: CGSize(width: 40, height: 50))
        view.addSubview(countryLable)
        countryLable.anchorWithCenterXY(top: closeButton.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, centerX: nil, centerY: nil, padding: .init(top: 30, left: 25, bottom: 0, right: 0), size: .init(width: 0, height: 25))
        
        view.addSubview(mainCollectionView)
        mainCollectionView.anchorWithCenterXY(top: topImage.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, centerX: nil, centerY: nil, padding: .init(top: 5, left: 3, bottom: 1, right: 3), size: .init(width: 0, height: 0))
        
        barView.backgroundColor = .white
        barView.translatesAutoresizingMaskIntoConstraints = false
        barView.layer.applySketchShadow(color: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.077), alpha: 1, x: 0, y: 8, blur: 10, spread: 0)
        view.addSubview(barView)
        barView.anchorWithCenterXY(top: settingsButton.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, centerX: nil, centerY: nil, padding: .init(top: 2, left: 5, bottom: 0, right: 5), size: CGSize(width: 0, height: 40))
        let stack = UIStackView(arrangedSubviews: [sortButton, filterButton, mapButton, searchButton])
        stack.distribution = .fillProportionally
        stack.spacing = 2
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        barView.addSubview(stack)
        stack.fillSuperview()
        

        
        
    }
    
    @objc private func dismissMe() {
        dismiss(animated: true, completion: nil)
    }
}

extension CountryViewController : UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: sliderCellIdentifier, for: indexPath) as! CountryTableViewCell
//            cell.cellImageView.image = #imageLiteral(resourceName: "Panel copy-5")
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return .init(width: mainCollectionView.frame.width - 5, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
    
}

class CountryTableViewCell: UICollectionViewCell {
    let cardImageView: UIImageView = {
        let imgV = UIImageView()
//        let img = UIImage(named: "notificCell")
        imgV.backgroundColor = .red
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.clipsToBounds = true
        return imgV
    }()
    
    let titleLable: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.CairoBold(of: 13)
        lbl.textAlignment = .natural
        lbl.numberOfLines = 1
        lbl.text = "ashnsad title"
        lbl.textColor = #colorLiteral(red: 0.395662725, green: 0.3921864033, blue: 0.3964013457, alpha: 1)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let priceLable: UILabel = {
        let lbl = UILabel()
        lbl.font = .CairoBold(of: 10)
        lbl.textAlignment = .right
        lbl.numberOfLines = 1
        lbl.text = "222 EGP"
        lbl.textColor = #colorLiteral(red: 0.07573596388, green: 0.3161551058, blue: 0.3230599165, alpha: 1)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let addressLable: UILabel = {
        let lbl = UILabel()
        lbl.font = .CairoSemiBold(of: 9)
        lbl.textAlignment = .natural
        lbl.numberOfLines = 1
        lbl.text = "Cairo, Egypt"
        lbl.textColor = #colorLiteral(red: 0.395662725, green: 0.3921864033, blue: 0.3964013457, alpha: 1)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let discLable: UILabel = {
        let lbl = UILabel()
        lbl.font = .CairoRegular(of: 10)
        lbl.textColor = .blueGrey
        lbl.numberOfLines = 2
        lbl.text = "init(coder:) has not been implemented"
        lbl.textColor = #colorLiteral(red: 0.4348744154, green: 0.4314044118, blue: 0.4356125593, alpha: 1)
        lbl.textAlignment = .natural
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let backwhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.applySketchShadow(color: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.077), alpha: 1, x: 0, y: 8, blur: 10, spread: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.cornerRadius = 5
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .white
        isOpaque = false
        backgroundView = nil
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        setupCell()
    }; required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented") }
    
    private func setupCell() {
        
        contentView.addSubview(backwhiteView)
        NSLayoutConstraint.activate([
            backwhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            backwhiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            backwhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            backwhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
            ])
//
        backwhiteView.addSubview(cardImageView)
        NSLayoutConstraint.activate([
            cardImageView.centerYAnchor.constraint(equalTo: backwhiteView.centerYAnchor),
            cardImageView.leadingAnchor.constraint(equalTo: backwhiteView.leadingAnchor, constant: 5),
            cardImageView.widthAnchor.constraint(equalTo: backwhiteView.widthAnchor, multiplier: 0.35),
            cardImageView.heightAnchor.constraint(equalTo: backwhiteView.heightAnchor, multiplier: 0.9)
            ])

        let starsStack = UIStackView(arrangedSubviews: [starsImageView(), priceLable])
        let stack = UIStackView(arrangedSubviews:
            [titleLable,
             lineViewww(),
             discLable,
             lineViewww(),
             starsStack,
             lineViewww(),
             addressLable
            ])
        stack.distribution = .fillProportionally
        stack.spacing = 2
        stack.axis = .vertical
        contentView.addSubview(stack)
        stack.anchorWithCenterXY(top: cardImageView.topAnchor, leading: cardImageView.trailingAnchor, bottom: cardImageView.bottomAnchor, trailing: contentView.trailingAnchor, centerX: nil, centerY: nil, padding: .init(top: 0, left: 5, bottom: 0, right: 5), size: .init(width: 0, height: 0))
        
    }
    
}
class lineViewww: UIView {
    override var intrinsicContentSize: CGSize {
        backgroundColor = #colorLiteral(red: 0.8704960942, green: 0.8706427813, blue: 0.8704755306, alpha: 1)
        return CGSize(width: 0, height: 1)
    }
}
class starsImageView: UIImageView {
    override var intrinsicContentSize: CGSize {
        backgroundColor = .green
        return CGSize(width: 0, height: 30)
    }
}

extension UIButton {
    func addButtomView(color: UIColor) {
        let view = UIView()
        view.backgroundColor = color
        addSubview(view)
        view.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .zero, size: .init(width: 0, height: 3))
    }
}
