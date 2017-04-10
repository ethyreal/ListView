//
//  CellDescriptor.swift
//  ListView
//
//  Created by George Webster on 4/7/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import UIKit

public struct CellDescriptor {
    
    let cellClass: UITableViewCell.Type
    let reuseIdentifier: String
    let configure: (UITableViewCell) -> ()
    
    init<Cell: UITableViewCell>(reuseIdentifier:String = "cell", configure: @escaping (Cell) -> ()) {
        self.cellClass = Cell.self
        self.reuseIdentifier = reuseIdentifier
        
        self.configure = { cell in
            configure(cell as! Cell)
        }
    }
}
