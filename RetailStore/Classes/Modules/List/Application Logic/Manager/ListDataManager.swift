//
//  ListDataManager.swift
//  
//
//  Created by Başak Ertuğrul on 9.11.2021.
//

import Foundation

public class ListDataManager {
    var coreDataStore = coreDataStore.sharedInstance
    var productsArray = [Product]()
    init() {
        if let products = readProductsFromPlist(){
            self.productsArray = products
        }
    }
    
    func readProductsFromPlist() -> [Product]? {
        if let fileUrl = Bundle.main.url(forResource: "Products", withExtension: "plist"),
           let data = try? Data(contentsOf: fileUrl)
        {
            if let result = try? PropertyListSerialization.PropertyList(from: data, options: [], format: nil) as? [String: Any] {
                if let dict = result, let array = (dict["Products"] as? [Any]) {
                    let productsArray = products(from: array)
                    return productsArray
                }
            }
        }
        return nil
    }
    
    func products(from array: [Any]) -> [Product]{
        var productsArray = [Product]()
        for value in array {
            if let dict = value as? [String : Any]{
                let newProduct = Product()
                newProduct.productId = dict["productId"] as! NSNumber
                newProduct.name = dict["name"] as! String
                newProduct.categoryId = dict["categoryId"] as! NSNumber
                newProduct.price = dict["price"] as! NSNumber
                newProduct.imageName = dict["imageName"] as! String
                productsArray.append(newProduct)
            }
        }
        return productsArray
    }
    
    
}
