//
//  Constants.swift
//  
//
//  Created by Başak Ertuğrul on 9.11.2021.
//

import Foundation

//enum

enum Category: Int {
    
    case Electronics = 1, Furniture
    
    func title() -> String {
        switch self {
        case .Electronics:
            return "Electronics"
        default:
            return "Furniture"
        }
    }
    
}
