//
//  categoryCell.swift
//  Appstore
//
//  Created by Selva Balasubramanian on 22/05/2018.
//  Copyright © 2018 Selva Balasubramanian. All rights reserved.
//

import UIKit

class categoryCell: UICollectionViewCell , UICollectionViewDataSource , UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "appCell", for: indexPath) as! appCell
            cell.image.image = UIImage.init(named: "Image-"+"\(indexPath.item + 1)")
//        cell.image.backgroundColor = .white
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: self.frame.height - 20, height: self.frame.height - 10)
    }
    

    func setupCell(){
//        self.backgroundColor = .green
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0 , y: 20 , width: self.frame.width, height: self.frame.height - 20), collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(appCell.self , forCellWithReuseIdentifier: "appCell")
        layout.scrollDirection = .horizontal
        self.addSubview(collectionView)
    }
    
}
