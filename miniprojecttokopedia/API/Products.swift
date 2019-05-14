//
//  Products.swift
//  miniprojecttokopedia
//
//  Created by Ivan Lipotan on 8/5/19.
//

import Foundation


struct Products {
    
    
    let image_uri : String
    let name: String
    let price : String
    
    
    
    init(dictionary: ProductsJSON){
        self.name = dictionary["name"] as! String
        self.image_uri = dictionary["image_uri"] as! String
        self.price = dictionary["price"] as! String
        
    }
}
