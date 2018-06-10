//
//  categoryCell.swift
//  Appstore
//
//  Created by Selva Balasubramanian on 22/05/2018.
//  Copyright © 2018 Selva Balasubramanian. All rights reserved.
//

import UIKit

class categoryCell: UICollectionViewCell , UICollectionViewDataSource , UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {

    var apps =  [app]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor  = .white
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "appCell", for: indexPath) as! appCell
            cell.image.image = UIImage.init(named: apps[indexPath.item].imageName)
        if(apps[indexPath.item].price == ""){
            cell.priceLabel.text = apps[indexPath.item].price
        }
        else{
            cell.priceLabel.text = "$" + apps[indexPath.item].price
        }
            cell.appnameLabel.text = apps[indexPath.item].name
            cell.categoryLabel.text = apps[indexPath.item].category
        cell.image.backgroundColor = .white
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: self.frame.height-93, height: self.frame.height-20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(0, 10, 0, 0)
    }
    
    var categoryLabel : UILabel = {
        let label = UILabel()
        label.text = "The Best Selling Category"
        label.font  = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 2
        return label
    }()
    
    
    func setupCell(){
//        self.backgroundColor = .green
        
        self.addSubview(categoryLabel)
        categoryLabel.frame = CGRect(x: 10, y: 0, width: self.frame.width, height: 25)
        categoryLabel.backgroundColor = .white
    
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: CGRect(x: 0 , y: 30 , width: self.frame.width, height: self.frame.height - 20), collectionViewLayout: layout)
        self.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(appCell.self , forCellWithReuseIdentifier: "appCell")
        layout.scrollDirection = .horizontal
        
        let horizontalLine = UIView()
        horizontalLine.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(horizontalLine)
        horizontalLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0 ).isActive = true
        horizontalLine.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 0 ).isActive = true
        horizontalLine.topAnchor.constraint(equalTo: self.bottomAnchor, constant: -1).isActive = true
        horizontalLine.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        horizontalLine.backgroundColor = .gray
        
    }
    
}
