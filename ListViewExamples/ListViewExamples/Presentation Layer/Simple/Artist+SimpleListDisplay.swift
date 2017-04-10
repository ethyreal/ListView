//
//  Artist+ListPresention.swift
//  ListViewExamples
//
//  Created by George Webster on 4/8/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import UIKit

extension Artist {
    
    func configure(_ cell:SimpleListCell) {
        cell.textLabel?.text = self.name
        cell.detailTextLabel?.text = self.yearsActive
    }
}
