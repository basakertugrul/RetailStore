//
//  ListInteractor.swift
//  
//
//  Created by Başak Ertuğrul on 9.11.2021.
//

import Foundation

public class ListInteractor{
    
    let dataManager = ListDataManager
    var products: Variable<[Product]> = Variable([])
    //modifie olunca içindeki bildirim geliyor.
    
    init(dataManager: ListDataManager){
        self.dataManager = dataManager
    }
    
    func fetchProductsFromStore(){
        self.products.value.removeAll()
        for prod in dataManager.productsArray {
            self.products.value.append(prod)
        }
    }
    
}


