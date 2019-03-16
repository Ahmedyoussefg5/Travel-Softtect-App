//
//  ViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/21/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit
//import SideMenu

class HotelsViewController: UIViewController {
    let topImage: UIImageView = {
        let img = UIImageView(image: UIImage(imageLiteralResourceName: "HomeBg"))
        img.clipsToBounds = true
        return img
    }()
    let starsImage: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.backgroundColor = .green
        return img
    }()
    let HotelLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.font = .CairoBold(of: 20)
        let title = "Hotel Hotel"
        lable.textAlignment = .left
        lable.text = title
        lable.makeOutLine(oulineColor: .black, foregroundColor: .white)
        return lable
    }()
    let aboutLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = .CairoBold(of: 20)
        let title = "about about Hotel Hotel"
        lable.textAlignment = .left
        lable.text = title
        return lable
    }()
    let aboutDiscLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.font = .CairoRegular(of: 12)
        let title = "Hotel is Perfect Perfect Perfect Perfect Perfect Hotel"
        lable.textAlignment = .left
        lable.numberOfLines = 4
        lable.textColor = .darkGray
        lable.text = title
        return lable
    }()
    let sortButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sort", for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 10)
        btn.setTitleColor(.black, for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: -10, bottom: 10, right: 0)
//        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
        btn.setImage(UIImage(imageLiteralResourceName: "sort"), for: .normal)
        return btn
    }()
    let filterButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Filter", for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 10)
        btn.setTitleColor(.black, for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: -10, bottom: 10, right: 0)
//        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
        btn.setImage(UIImage(imageLiteralResourceName: "filter"), for: .normal)
        return btn
    }()

    let searchButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.addButtomView(color: #colorLiteral(red: 0.8199338913, green: 0.515894115, blue: 0.1775934994, alpha: 1))
        btn.backgroundColor = .white
        btn.setImage(UIImage(imageLiteralResourceName: "search2").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 9, left: 9, bottom: 9, right: 9)
        btn.addTarget(self, action: #selector(showSearchVC), for: UIControl.Event.touchUpInside)
//        btn.setBackgroundImage(UIImage(imageLiteralResourceName: "flights"), for: .normal)
        return btn
    }()
    
    @objc func showSearchVC() {
        let search = SearchViewController()
        present(search, animated: true, completion: nil)
    }
    
//    let sortButton: UIButton = {
//        let btn = UIButton(type: .system)
//        btn.setTitle("Sort", for: .normal)
//        btn.backgroundColor = .white
//        btn.titleLabel?.font = .CairoSemiBold(of: 13)
//        btn.setTitleColor(.black, for: .normal)
//        btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 18, bottom: 10, right: 18)
//        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
//        btn.setImage(UIImage(imageLiteralResourceName: "sort"), for: .normal)
//        return btn
//    }()
//    let filterButton: UIButton = {
//        let btn = UIButton(type: .system)
//        btn.setTitle("Filter", for: .normal)
//        btn.backgroundColor = .white
//        btn.titleLabel?.font = UIFont.CairoSemiBold(of: 13)
//        btn.setTitleColor(.black, for: .normal)
//        btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 18, bottom: 10, right: 18)
//        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
//        btn.setImage(UIImage(imageLiteralResourceName: "filter"), for: .normal)
//        return btn
//    }()
    let closeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(imageLiteralResourceName: "group9"), for: .normal)
        btn.addTarget(self, action: #selector(dismissMe), for: .touchUpInside)
        return btn
    }()
    
    let firstDateButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("From", for: .normal)
//        btn.backgroundColor = .white
        btn.titleLabel?.font = .CairoSemiBold(of: 10)
        btn.setTitleColor(.black, for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 18)
//        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
        btn.setImage(UIImage(imageLiteralResourceName: "selectday"), for: .normal)
        btn.addTarget(self, action: #selector(handleDatePicker(_:)), for: .touchUpInside)
        return btn
    }()
    let secoundDateButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("To", for: .normal)
//        btn.backgroundColor = .white
        btn.titleLabel?.font = .CairoSemiBold(of: 10)
        btn.setTitleColor(.black, for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 18)
        btn.setImage(UIImage(imageLiteralResourceName: "selectday"), for: .normal)
        btn.addTarget(self, action: #selector(handleDatePicker(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var mainTableView: UITableView = {
        let tableV = UITableView()
        tableV.backgroundColor = .clear
        tableV.isOpaque = false
        tableV.backgroundView = nil
        tableV.tableFooterView = UIView()
        tableV.translatesAutoresizingMaskIntoConstraints = false
        tableV.separatorInset = .init(top: 10, left: 0, bottom: 10, right: 0)
        tableV.separatorColor = .clear
        tableV.allowsSelection = false
        tableV.register(UINib.init(nibName: "HotelsTableCell", bundle: nil), forCellReuseIdentifier: "HotelsTableCell")
        tableV.delegate = self
        tableV.dataSource = self
        return tableV
    }()
    let barView = UIView()
    
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


        view.addSubview(topImage)
        topImage.anchorWithCenterXY(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil, centerX: view.centerXAnchor, centerY: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: view.frame.height * 0.3))
        view.addSubview(closeButton)
        closeButton.anchorWithCenterXY(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, centerX: nil, centerY: nil, padding: .init(top: 20, left: 10, bottom: 0, right: 0), size: .init(width: 20, height: 30))
        view.addSubview(starsImage)
        starsImage.anchor(top: nil, leading: view.leadingAnchor, bottom: topImage.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 10, bottom: 10, right: 0), size: .init(width: view.frame.width * 0.3, height: 20))
        view.addSubview(searchButton)
        searchButton.anchorWithCenterXY(top: nil, leading: nil, bottom: topImage.bottomAnchor, trailing: view.trailingAnchor, centerX: nil, centerY: nil, padding: .init(top: 0, left: 0, bottom: -10, right: 10), size: CGSize(width: 40, height: 50))
        view.addSubview(HotelLable)
        HotelLable.anchorWithCenterXY(top: nil, leading: starsImage.leadingAnchor, bottom: starsImage.topAnchor, trailing: nil, centerX: nil, centerY: nil, padding: .init(top: 0, left: 0, bottom: 5, right: 0), size: .init(width: view.frame.width * 0.8, height: 25))
        
        view.addSubview(aboutLable)
        aboutLable.anchor(top: topImage.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10), size: .zero)
        
        view.addSubview(aboutDiscLable)
        aboutDiscLable.anchor(top: aboutLable.bottomAnchor, leading: aboutLable.leadingAnchor, bottom: nil, trailing: aboutLable.trailingAnchor, padding: .init(top: -4, left: 0, bottom: 0, right: 0), size: .zero)
        
        let blueView = UIView()
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.backgroundColor = #colorLiteral(red: 0.8193261027, green: 0.943588078, blue: 0.993334353, alpha: 1)
        blueView.layer.borderWidth = 1
        blueView.layer.borderColor = #colorLiteral(red: 0.7011614442, green: 0.8568746448, blue: 0.9286885858, alpha: 1)
        view.addSubview(blueView)
        blueView.anchor(top: aboutDiscLable.bottomAnchor, leading: aboutLable.leadingAnchor, bottom: nil, trailing: aboutLable.trailingAnchor, padding: .init(top: 7, left: 2, bottom: 0, right: 2), size: .init(width: 0, height: 30))
        let lable = UILabel()
        lable.text = "Rooms"
        lable.font = .CairoSemiBold(of: 15)
        lable.translatesAutoresizingMaskIntoConstraints = false
        blueView.addSubview(lable)
        lable.anchorWithCenterXY(top: nil, leading: blueView.leadingAnchor, bottom: nil, trailing: nil, centerX: nil, centerY: blueView.centerYAnchor, padding: .init(top: 5, left: 3, bottom: 0, right: 0))
        let stackk = UIStackView(arrangedSubviews: [sortButton, filterButton])
        stackk.distribution = .fillEqually
        stackk.spacing = 2
        stackk.axis = .horizontal
        blueView.addSubview(stackk)
        stackk.anchorWithCenterXY(top: nil, leading: nil, bottom: nil, trailing: blueView.trailingAnchor, centerX: nil, centerY: blueView.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 5), size: .init(width: 120, height: 0))
        
        
        
        let stack = UIStackView(arrangedSubviews: [firstDateButton, secoundDateButton])
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        view.addSubview(stack)
        stack.anchor(top: blueView.bottomAnchor, leading: blueView.leadingAnchor, bottom: nil, trailing: blueView.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 40))
        
        view.addSubview(mainTableView)
        mainTableView.anchor(top: stack.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 0, right: 0))
        
        
        
        
        
        
        
        
        
        
        
        
//        view.addSubview(mainCollectionView)
//        mainCollectionView.anchorWithCenterXY(top: topImage.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, centerX: nil, centerY: nil, padding: .init(top: 5, left: 3, bottom: 1, right: 3), size: .init(width: 0, height: 0))
//
//        barView.backgroundColor = .white
//        barView.translatesAutoresizingMaskIntoConstraints = false
//        barView.layer.applySketchShadow(color: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.077), alpha: 1, x: 0, y: 8, blur: 10, spread: 0)
//        view.addSubview(barView)
        
        
//        barView.anchorWithCenterXY(top: settingsButton.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, centerX: nil, centerY: nil, padding: .init(top: 2, left: 5, bottom: 0, right: 5), size: CGSize(width: 0, height: 40))
//        let stack = UIStackView(arrangedSubviews: [sortButton, filterButton, mapButton, searchButton])
//        stack.distribution = .fillProportionally
//        stack.spacing = 2
//        stack.axis = .horizontal
//        barView.addSubview(stack)
//        stack.fillSuperview()
        

        
        
    }
    
    @objc private func dismissMe() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func handleDatePicker(_ sender: UIButton) {
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.year = 5
        let aYear = Calendar.current.date(byAdding: dateComponents, to: currentDate)
        
        let datePicker = DatePickerDialog(textColor: .black, buttonColor: .red, font: .boldSystemFont(ofSize: 17), showCancelButton: true)
        datePicker.show("Pickup your day",
                        doneButtonTitle: "Pick",
                        cancelButtonTitle: "Cancel",
                        minimumDate: currentDate,
                        maximumDate: aYear,
                        datePickerMode: .date) { (date) in
                            guard let date = date else { return }
                            sender.setTitle(self.getDateToString(date: date), for: .normal)
                            }
    }
    
    func getDateToString (date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let myString = formatter.string(from: date)
        let Date = formatter.date(from: myString)
        formatter.dateFormat = "yyyy-MM-dd"
        let myStringafd = formatter.string(from: Date!)
        return myStringafd
    }
    
}

extension HotelsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelsTableCell", for: indexPath) as! HotelsTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 168
    }
}
