//
//  appCell.swift
//  Appstore
//
//  Created by Selva Balasubramanian on 22/05/2018.
//  Copyright © 2018 Selva Balasubramanian. All rights reserved.
//

import UIKit

class appCell: UICollectionViewCell {
    
    var image : UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var appnameLabel : UILabel = {
        let label = UILabel()
        label.text = "Vector 2"
        label.font  = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    var categoryLabel : UILabel = {
        let label = UILabel()
        label.text = "Adventure"
        label.font  = UIFont.systemFont(ofSize: 13)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.textColor = .gray
        return label
    }()
    

    
    var priceLabel : UILabel = {
        let label = UILabel()
        label.text = "$4.00"
        label.font  = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 1
        label.textColor = .gray
        return label
    }()
    
    
    func setupCell(){
        image = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.width))
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        self.backgroundColor = .white
        
        self.addSubview(image)
        self.addSubview(appnameLabel)
        self.addSubview(categoryLabel)
        self.addSubview(priceLabel)
        appnameLabel.frame = CGRect(x:  0, y: image.frame.height + 1, width: self.frame.width, height: 20)
        categoryLabel.frame = CGRect(x:  0, y: image.frame.height + 2 + 21 , width: self.frame.width, height: 15)
        priceLabel.frame = CGRect(x:  0, y: image.frame.height + 2 + 36, width: self.frame.width, height: 15)
        
    }
    
    
    
}
