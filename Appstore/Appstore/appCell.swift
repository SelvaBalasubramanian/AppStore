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
    
    
    func setupCell(){
        image = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.width))
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        self.addSubview(image)
    }
    
    
    
}
