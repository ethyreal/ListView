//
//  SectionDescriptor.swift
//  ListView
//
//  Created by George Webster on 4/7/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import Foundation

public struct SectionDescriptor<Item> {
    
    let headerView:UIView?
    let footerView:UIView?
    
    let headerTitle:String?
    let footerTitle:String?
    
    let items:[Item]
    
    
}

extension SectionDescriptor {
    
    init(items:[Item]) {
        self.init(headerView:nil, footerView:nil, headerTitle:nil, footerTitle:nil , items:items)
    }
    
    init(items:[Item], headerTitle:String?, footerTitle:String?) {
        self.init(headerView:nil, footerView:nil, headerTitle:headerTitle, footerTitle:footerTitle , items:items)
    }
    
    init(items:[Item], headerView:UIView?, footerView:UIView?) {
        self.init(headerView:headerView, footerView:footerView, headerTitle:nil, footerTitle:nil, items:items)
    }
}


