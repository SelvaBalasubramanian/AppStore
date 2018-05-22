//
//  ViewController.swift
//  Appstore
//
//  Created by Selva Balasubramanian on 22/05/2018.
//  Copyright © 2018 Selva Balasubramanian. All rights reserved.
//

import UIKit

class ViewController: UIViewController  , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load")
        self.view.backgroundColor = .white
        self.title = "Featured Apps"
        
        addCategoryCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"categoryCell", for: indexPath) as! categoryCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: self.view.frame.width, height: self.view.frame.height/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(20, 0, 5, 0)
    }

    
    
    func addCategoryCollectionView(){
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height) , collectionViewLayout: layout)
        collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
        collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0)
        collectionView.backgroundColor = .white
        self.view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(categoryCell.self, forCellWithReuseIdentifier: "categoryCell")
        
    }


}

