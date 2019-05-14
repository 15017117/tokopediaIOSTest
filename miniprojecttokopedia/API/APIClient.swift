//
//  APIClient.swift
//  miniprojecttokopedia
//
//  Created by Ivan Lipotan on 8/5/19.
//

import Foundation

typealias ProductsJSON = [String: Any]

struct APIClient {
    
    static func getProductsAPI(completion: @escaping (ProductsJSON?) -> Void) {
        
        let url = URL(string: "https://ace.tokopedia.com/search/v2.5/product?q=samsung&pmin=10000&pmax=100000&wholesale=true&official=true&fshop=2&start=0&rows=10")
        
        let session = URLSession.shared
        
        guard let unwrappedURL = url else { print("Error unwrapping URL"); return }
        
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedDAta = data else { print("Error unwrapping data"); return }
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedDAta, options: []) as? ProductsJSON
                
                //print("GET THE RESPONSE JSON\(String(describing: responseJSON))")
                completion(responseJSON)
                
               
            } catch {
                print("Could not get API data. \(error), \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}

