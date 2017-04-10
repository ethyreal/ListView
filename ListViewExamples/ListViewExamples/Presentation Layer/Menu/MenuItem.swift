//
//  MenuItem.swift
//  ListViewExamples
//
//  Created by George Webster on 4/9/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import Foundation

enum MenuItemType {
    case simple, multiCell, multiSection
}

struct MenuItem {
    
    let itemType:MenuItemType
    let title:String
    let subtitle:String
}


extension MenuItem {
    
    static func all() -> [MenuItem] {
        return [
            MenuItem(itemType: .simple, title: "Simple", subtitle: "Using only an array of items")
        ]
    }
}
