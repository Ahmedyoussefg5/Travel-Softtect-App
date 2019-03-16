//
//  ViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/21/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var sliderCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collV.isPagingEnabled = true
        collV.backgroundColor = .white
        collV.register(SliderCell.self, forCellWithReuseIdentifier: sliderCellIdentifier)
        collV.delegate = self
        collV.dataSource = self
        return collV
    }()
    lazy var pageControl: UIPageControl = {
        let pager = UIPageControl()
        pager.currentPage = 0
        pager.numberOfPages = 10
        pager.currentPageIndicatorTintColor = .white
        pager.pageIndicatorTintColor = #colorLiteral(red: 0.4352941176, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        pager.backgroundColor = .clear
        return pager
    }()
    
    lazy var hotelsButton: homeButton = {
        let btn = homeButton(text: "Hotels", image: #imageLiteral(resourceName: "hotels"))
        btn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToHotels)))
        return btn
    }()
    let flightsButton: homeButton = {
        let btn = homeButton(text: "Flights", image: #imageLiteral(resourceName: "flights"))
        return btn
    }()
    let packagesButton: homeButton = {
        let btn = homeButton(text: "Packages", image: #imageLiteral(resourceName: "packages"))
        return btn
    }()
    
    @objc func goToHotels() {
        present(HotelsViewController(), animated: true, completion: nil)
    }
    
    let sliderCellIdentifier = "sliderCell"

    
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9998950362, green: 1, blue: 0.9998714328, alpha: 1)
//        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextPage () {
        let nextIndexPath: IndexPath
        let currentPage = pageControl.currentPage
        if currentPage == pageControl.numberOfPages - 1 {
            nextIndexPath = IndexPath(row: 0, section: 0)
        } else {
            nextIndexPath = IndexPath(row: currentPage + 1, section: 0)
        }
        sliderCollectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
    }
    
    fileprivate func setupView() {
        let topImage: UIImageView = {
            let img = UIImageView(image: UIImage(imageLiteralResourceName: "HomeBg"))
            img.clipsToBounds = true
            return img
        }()
        let topDistLable: UILabel = {
            let lable = UILabel()
            lable.textColor = #colorLiteral(red: 0.09662369639, green: 0.4007624984, blue: 0.5455793738, alpha: 1)
            lable.font = .CairoBold(of: 17)
            let title = "Top Destinitions"
            lable.textAlignment = .left
            lable.text = title
            return lable
        }()

        view.addSubview(topImage)
        topImage.anchorWithCenterXY(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil, centerX: view.centerXAnchor, centerY: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: view.frame.height * 0.38))
        
        let stackTwo = UIStackView(arrangedSubviews:
            [ hotelsButton,
              lineVieww(),
              flightsButton,
              lineVieww(),
              packagesButton
            ])
        stackTwo.distribution = .fillProportionally
        stackTwo.spacing = 0
        stackTwo.axis = .horizontal
        view.addSubview(stackTwo)
        stackTwo.anchorWithCenterXY(top: topImage.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, centerX: view.centerXAnchor, centerY: nil, padding: .init(top: 3, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 85))
        let horizontalLineView = UIView()
        horizontalLineView.backgroundColor = .gray
        view.addSubview(horizontalLineView)
        horizontalLineView.anchorWithCenterXY(top: stackTwo.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, centerX: view.centerXAnchor, centerY: nil, padding: .init(top: 10, left: 3, bottom: 0, right: 3), size: .init(width: 0, height: 0.8))

        let vLineView = UIView()
        vLineView.backgroundColor = #colorLiteral(red: 0.9076377153, green: 0.5600492358, blue: 0.1002748385, alpha: 1)
        view.addSubview(vLineView)
        vLineView.anchorWithCenterXY(top: horizontalLineView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, centerX: nil, centerY: nil, padding: .init(top: 35, left: 9, bottom: 0, right: 0), size: .init(width: 5, height: 24))
        view.addSubview(topDistLable)
        topDistLable.anchorWithCenterXY(top: nil, leading: vLineView.trailingAnchor, bottom: nil, trailing: nil, centerX: nil, centerY: vLineView.centerYAnchor, padding: .init(top: 0, left: 5, bottom: 0, right: 0), size: .init(width: 0, height: 20))
        view.addSubview(sliderCollectionView)
        sliderCollectionView.anchorWithCenterXY(top: vLineView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, centerX: nil, centerY: nil, padding: .init(top: 10, left: 5, bottom: 0, right: 5), size: .init(width: 0, height: view.frame.height * 0.3))
        view.addSubview(pageControl)
        pageControl.anchorWithCenterXY(top: nil, leading: sliderCollectionView.leadingAnchor, bottom: sliderCollectionView.bottomAnchor, trailing: sliderCollectionView.trailingAnchor, centerX: nil, centerY: nil, padding: .zero, size: .init(width: sliderCollectionView.frame.width, height: 20))

    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: sliderCellIdentifier, for: indexPath) as! SliderCell
            cell.cellImageView.image = #imageLiteral(resourceName: "HomeBg")
            return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return .init(width: (sliderCollectionView.frame.width / 2) - 5, height: sliderCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == sliderCollectionView {
            let currentPage = indexPath.row
            pageControl.currentPage = currentPage
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let countryVC = CountryViewController()
        present(countryVC, animated: true, completion: nil)
    }
    
}

class lineView: UIView {
    init(image: UIImage, text: String) {
        super.init(frame: .zero)
        let imgView = UIImageView(image: image)
        imgView.clipsToBounds = true
        addSubview(imgView)
        imgView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        let lable = UILabel()
        lable.textAlignment = .center
        lable.text = text
        lable.font = UIFont.CairoSemiBold(of: 15)
        lable.textColor = #colorLiteral(red: 0.09029180557, green: 0.3850295544, blue: 0.5382000208, alpha: 1)
        addSubview(lable)
        lable.anchor(top: imgView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        lable.heightAnchor.constraint(equalToConstant: 20).isActive = true
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class lineVieww: UIView {
    override var intrinsicContentSize: CGSize {
        backgroundColor = .gray
        return CGSize(width: 1, height: 0)
    }
}

class homeLable: UILabel {
    init(texts: String) {
        super.init(frame: .zero)
        textAlignment = .center
        text = texts
        font = .CairoBold(of: 17)
        textColor = #colorLiteral(red: 0.09029180557, green: 0.3850295544, blue: 0.5382000208, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class homeButton: UIView {
    init(text: String, image: UIImage) {
        super.init(frame: .zero)
        backgroundColor = .white
        let imgV = UIImageView(image: image)
        imgV.contentMode = .scaleToFill
        imgV.clipsToBounds = true
        let lable = homeLable(texts: text)
//        addSubview(lable)
//        addSubview(imgV)
        let stack = UIStackView(arrangedSubviews: [imgV, lable])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        isUserInteractionEnabled = true
        stack.axis = .vertical
        addSubview(stack)
        imgV.heightAnchor.constraint(equalTo: stack.heightAnchor, multiplier: 0.8).isActive = true
        stack.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
