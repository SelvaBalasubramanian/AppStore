//
//  ViewController.swift
//  Appstore
//
//  Created by Selva Balasubramanian on 22/05/2018.
//  Copyright © 2018 Selva Balasubramanian. All rights reserved.
//

import UIKit

class ViewController: UIViewController  , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    var categoryArray = [category]()
    var collectionView : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load")
        self.title = "Featured Apps"
        self.view.backgroundColor = .gray
        
        DispatchQueue.main.async {
            let url = URL(string: "https://api.letsbuildthatapp.com/appstore/featured")
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                
                if(error != nil){
                    print(error!)
                }
                else{
                    let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    let categoriesJSON = json["categories"]as! NSArray
                    var temp : category!
                    print(categoriesJSON)
                    for a in categoriesJSON {
                        let b = a as!  NSDictionary
                        temp = category(name: " ")
                        temp.name = b.value(forKey: "name") as? String ?? " "
                        temp.type = b.value(forKey: "type") as? String ?? " "
                        for  k in b["apps"] as! NSArray {
                            let kk = k as! NSDictionary
                            let m = app.init(json: kk)
                            temp.apps.append(m)
                        }
                        self.categoryArray.append(temp)
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }
                }
                
            }).resume()
        }


        addCategoryCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"categoryCell", for: indexPath) as! categoryCell
        cell.apps = categoryArray[indexPath.item].apps
        cell.categoryLabel.text = categoryArray[indexPath.item].name
        cell.vc = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: self.view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(20, 0, 5, 0)
    }

    
    
    func addCategoryCollectionView(){
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        self.view.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: 0).isActive = true
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(categoryCell.self, forCellWithReuseIdentifier: "categoryCell")
        
        
    }

}


class category{
    var name : String
    var type : String
    var apps : [app]
    
    init(name: String){
        self.name = name
        self.type = ""
        self.apps = []
    }
    init(name : String , type : String , apps : [app]) {
        self.name = name
        self.type = type
        self.apps = apps
    }


}

class app{

    var id : Int
    var category : String
    var imageName : String
    var name : String
    var price : String
    
    init(json : NSDictionary){
        self.id = json["Id"] as? Int ?? 0
        self.category = json["Category"] as? String ?? "Kids"
        self.imageName = json["ImageName"] as? String ?? "Default"
        self.name = json["Name"] as? String ?? "Vector"
        if let p = json["Price"]{
            self.price = (p as AnyObject).stringValue
        }
        else{
            self.price = ""
        }
        
    }
    

    init(id : Int , category : String , imageName : String , name : String , price : String){
        self.id = id
        self.category = category
        self.imageName = imageName
        
        self.name = name
        self.price = price
    }
    
}
