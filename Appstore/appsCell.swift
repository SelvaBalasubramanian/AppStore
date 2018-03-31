//
//  appsCell.swift
//  Appstore
//
//  Created by Selva Balasubramanian on 21/01/2018.
//  Copyright © 2018 Selva Balasubramanian. All rights reserved.
//

import UIKit

class appsCell: UICollectionViewCell {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var app : App? {
        didSet{
            if app?.name != nil{
                self.nameLabel.text = app?.name
            }else{
                self.nameLabel.text = app?.imageName
            }
            
            if app?.category != nil{
                self.categoryLabel.text = app?.category
            }else{
                self.categoryLabel.text = "Kids"
            }
            
            if app?.price != nil{
                self.priceLabel.text = "$" + "\(app!.price!)"
            }else{
                self.priceLabel.text = ""
            }
            
            
        }
    }
    let imageView : UIImageView = {
        let image = UIImageView();
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .orange
        return image
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let categoryLabel : UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    
    let priceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        return label
        
    }()
    let priceTTT : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        return label
        
    }()
    
    func setupViews(){
        
        self.addSubview(imageView)
        self.addSubview(nameLabel)
        self.addSubview(categoryLabel)
        self.addSubview(priceLabel)
        
        imageView.frame = CGRect.init(x: 0, y: 24, width: frame.width, height: frame.width)
        nameLabel.frame  = CGRect.init(x: 0 , y: frame.width  + 28, width: frame.width, height: 36)
        categoryLabel.frame = CGRect.init(x: 0, y: frame.width + 64, width: frame.width, height: 18)
        priceLabel.frame = CGRect.init(x: 0, y: frame.width + 84 , width: frame.width, height: 18)

        
    }
    
    
    
    
    
}
