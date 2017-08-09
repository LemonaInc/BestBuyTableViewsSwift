//
//  File.swift
//  TableViewsThree
//
//  Created by Jaxon Stevens on 7/12/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import Foundation

class Category {
    
    
    let categoryId: String!
    let name: String!
    let hasSubcategories: Bool!
    let productCount: Int!
    
    
    init (categoryId: String, name: String, hasSubcategories: Bool, productCount: Int) {
        
        self.categoryId = categoryId
        self.name = name
        self.hasSubcategories = hasSubcategories
        self.productCount = productCount
        
    }
    
    
}
