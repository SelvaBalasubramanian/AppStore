//
//  AppDetailViewController.swift
//  Appstore
//
//  Created by Selva Balasubramanian on 20/06/2018.
//  Copyright © 2018 Selva Balasubramanian. All rights reserved.
//

import UIKit

class AppDetailViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{


    var app : app!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var infoCategory: UILabel!
    @IBOutlet weak var screenshotCollectionView: UICollectionView!
    @IBOutlet weak var PriceButton: UIButton!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var appIcon: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        screenshotCollectionView.delegate = self
        screenshotCollectionView.dataSource = self
        setViews()
    }
    
    func setViews(){
        self.appIcon.image = UIImage(named: app.imageName)
        appIcon.layer.cornerRadius = 10
        appIcon.layer.masksToBounds = true
        self.appNameLabel.text = app.name
        self.categoryLabel.text = app.category
        self.infoCategory.text = app.category
        self.PriceButton.layer.borderColor = UIColor(red: 0, green: 129/255, blue: 250/255, alpha: 1).cgColor
        PriceButton.layer.cornerRadius = 5
        PriceButton.layer.borderWidth = 1
        if(app.price != ""){
            PriceButton.titleLabel?.text = "$ " + app.price
        }else{
            PriceButton.titleLabel?.text = "BUY"

        }
        screenshotCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: "BannerCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        if(app.imageName == "frozen" || app.imageName == "telepaint"){
            cell.Image.image = UIImage(named: app.imageName + "\(indexPath.item + 1)")
        }
        else{
            cell.Image.image = UIImage(named: "telepaint" + "\(indexPath.item + 1)")
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height * 2 - 8 , height: collectionView.frame.height - 10 )
    }
    

}

class BannerCell : UICollectionViewCell{
    var Image : UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        Image = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.addSubview(Image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}










