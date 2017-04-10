//
//  MenuViewController.swift
//  ListViewExamples
//
//  Created by George Webster on 4/9/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import UIKit
import ETYListView


class MenuViewController: UIViewController, Stackable {

    let items:[MenuItem]
    
    var didSelect:(MenuItem) -> () = { _ in }
    
    init(items:[MenuItem]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.makeStackView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Menu"
        
        let list = ListView(items:self.items) { (cell:MenuCell, item) in
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = item.subtitle
            cell.accessoryType = .disclosureIndicator
        }
    
        list.didSelect = { [unowned self] item in
            self.didSelect(item)
        }
        
        self.addArrangedSubview(list)
    }
    


}
