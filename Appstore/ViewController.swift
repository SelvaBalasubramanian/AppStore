//
//  ViewController.swift
//  Appstore
//
//  Created by Selva Balasubramanian on 20/01/2018.
//  Copyright © 2018 Selva Balasubramanian. All rights reserved.
//

import UIKit

class FeaturedViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    var appCategory : [AppCategory]! = []
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
        self.collectionView?.backgroundColor = .white
        AppCategory.fetchApps { (appCategory1) in
            self.appCategory = appCategory1
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
            
        }
        
        
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appCategory.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.appCategory = appCategory[indexPath.item]
    
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
         return  CGSize(width: self.view.frame.width, height: 240)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


