//
//  CategoryRepo.swift
//  QatarSale
//
//  Created by Azmi on 6.11.2021.
//

import Foundation

class CategoryRepo {
    
    static var groups: [CategoryGroup] = [
        CategoryGroup(title: "Phone Call Tablets", items: [
            Category(id: 314, title: "Airplane"),
            Category(id: 1, title: "Men’s Clothing"),
            Category(id: 2, title: "Phones & Accessories"),
        ]),
        CategoryGroup(title: "Phone Call Tablets", items: [
            Category(id: 3, title: "Women’s Clothing"),
            Category(id: 4, title: "Men’s Clothing"),
            Category(id: 5, title: "Phones & Accessories"),
        ]),
        CategoryGroup(title: "Phone Call Tablets", items: [
            Category(id: 6, title: "Women’s Clothing"),
            Category(id: 7, title: "Men’s Clothing"),
            Category(id: 8, title: "Phones & Accessories"),
        ]),
        CategoryGroup(title: "Phone Call Tablets", items: [
            Category(id: 9, title: "Women’s Clothing"),
            Category(id: 10, title: "Men’s Clothing"),
            Category(id: 11, title: "Phones & Accessories"),
        ]),
    ]
}
