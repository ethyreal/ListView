//
//  MenuCell.swift
//  ListViewExamples
//
//  Created by George Webster on 4/7/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import UIKit


class SimpleListCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
