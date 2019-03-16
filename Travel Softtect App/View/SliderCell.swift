//
//  CategoryCell.swift
//  Tanta Services
//
//  Created by Youssef on 11/24/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit

class SliderCell : UICollectionViewCell {
    
    let cellImageView: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "Layer 7")
        imgV.contentMode = .scaleToFill
        return imgV
    }()
    let lable: UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.font = .CairoBold(of: 17)
        let title = "England"
        lable.textAlignment = .left
        lable.text = title
        return lable
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    
    func setupCell() {
        contentView.addSubview(cellImageView)
        cellImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
        contentView.addSubview(lable)
        lable.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 40, right: 40))
    }
    
    
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
    
    
}


