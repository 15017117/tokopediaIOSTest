//
//  DataStore.swift
//  miniprojecttokopedia
//
//  Created by Ivan Lipotan on 8/5/19.
//

import Foundation
import UIKit


final class DataStore{
    
    static let sharedInstance  = DataStore()
    
    fileprivate init(){}
    
    var newproducts:[Products] = []
    
    var images : [UIImage] = []
    
    
    func getProducts(completion: @escaping ()->Void){
        
        APIClient.getProductsAPI{(json) in
            
            if let data = json?["data"]as? [ProductsJSON]{
                
                print("GET DATA : \(data)")
                
                
                DispatchQueue.main.async{
                    
                    for dict in data{
                        
                        //print("GET DATA : \(dict)")
                        let newData = Products(dictionary: dict)
                        
                        
                        print("GET NEW DATA : \(newData)")
                        self.newproducts.append(newData)
                    }
                    
                    completion()
                    
                }
            }
            
        }
        
        
    }
    func getProductsImage(completion:@escaping ()->Void){
        getProducts {
            for imageproduct in self.newproducts{
                
                print("PRINT IMAGE PRODUCT : \(imageproduct)")
                let url = URL(string: imageproduct.image_uri)
                
                let data = try? Data(contentsOf: url!)
                
                if let imageData = data {
                    
                    let image = UIImage(data:imageData)
                    self.images.append(image!)
                }
            }
            
            OperationQueue.main.addOperation {
                completion()
            }
            
            
            
            
            
        }
    }
    
}
