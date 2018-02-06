//
//  AppCategory.swift
//  Appstore
//
//  Created by Selva Balasubramanian on 04/02/2018.
//  Copyright © 2018 Selva Balasubramanian. All rights reserved.
//

import UIKit

class AppCategory: NSObject {
    
    var name : String?
    var apps :[App]? = []
    

    static func fetchApps(completionHandler: @escaping ([AppCategory]) -> Void ){
        var appCategory = [AppCategory]()
        print("Function entered")
        let  url = URL.init(string: "https://api.letsbuildthatapp.com/appstore/featured")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!)
                    return
                
            }
            
            if let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers){
                let  json = jsonData as! NSDictionary
                let category = json.value(forKey: "categories") as! NSArray

                for a in category{

                        let eachCategoryItem = a as! NSDictionary
                        let appCateg = AppCategory()
                    appCateg.name =  eachCategoryItem.value(forKey: "name") as? String
                        let apps  = eachCategoryItem.value(forKey: "apps") as! NSArray
                    for aa in apps{
                        let a1 = aa as! NSDictionary
                        let app = App()

                            app.name =  a1.value(forKey: "Name") as? String
                        app.id =  a1.value(forKey: "Id") as? NSNumber
                        app.category =  a1.value(forKey: "Category") as? String
                         app.price =  a1.value(forKey: "Price") as? NSNumber
                         app.imageName =  a1.value(forKey: "ImageName") as? String
                        appCateg.apps?.append(app)
                    }
                    appCategory.append(appCateg)
                }
                print(appCategory.count)
                completionHandler(appCategory)
            }else{
                
            }
            
         }.resume()
    }
}


class App : NSObject {
  
    var name : String?
    var id : NSNumber?
    var category : String?
    var imageName : String?
    var price : NSNumber?
    
}
