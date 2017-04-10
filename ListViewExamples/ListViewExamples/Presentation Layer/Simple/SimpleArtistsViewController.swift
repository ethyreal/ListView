//
//  SimpleArtistViewController.swift
//  ListViewExamples
//
//  Created by George Webster on 4/7/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import UIKit
import ETYListView

class SimpleArtistViewController: UIViewController, Stackable {

    let artists:[Artist]
    
    var didSelect:(Artist) -> () = { _ in }

    init(artists:[Artist]) {
        self.artists = artists
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

        let list = ListView(items:self.artists) { (cell:SimpleListCell, item) in
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = item.yearsActive
            cell.accessoryType = .disclosureIndicator
        }
        
        list.didSelect = { [unowned self] item in
            self.didSelect(item)
        }

        self.addArrangedSubview(list)
    }
}

