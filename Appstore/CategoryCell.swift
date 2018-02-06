//
//  CategoryCellCollectionViewCell.swift
//  Appstore
//
//  Created by Selva Balasubramanian on 20/01/2018.
//  Copyright © 2018 Selva Balasubramanian. All rights reserved.
//

import UIKit


class CategoryCell : UICollectionViewCell , UICollectionViewDelegateFlowLayout , UICollectionViewDelegate  , UICollectionViewDataSource{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    var appCategory : AppCategory! {
        didSet {
            if let name  = appCategory.name{
                self.categoryLabel.text = name
            }
        }
    }
    let appsCollectionView : UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.backgroundColor   = .white
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(appsCell.self, forCellWithReuseIdentifier: "appsCell")
            return collectionView
    }()
    
    let horizontalLine  : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let categoryLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (appCategory.apps?.count)!
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "appsCell", for: indexPath) as? appsCell
        cell?.app = appCategory.apps![indexPath.item]
        cell?.imageView.image = UIImage.init(named: (cell?.app?.imageName)!)
            cell?.backgroundColor = .white
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        return  CGSize(width: 120, height: self.frame.height)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(categoryLabel)
        addSubview(appsCollectionView)
        addSubview(horizontalLine)
        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
     
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutFormatOptions(),
                                                      metrics: nil, views: ["v0" : appsCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[hl]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["hl":horizontalLine]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[hl]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["hl":categoryLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-4-[v1(24)][v0][hl(0.5)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1": categoryLabel, "v0" : appsCollectionView, "hl": horizontalLine]))
    }
    
}

