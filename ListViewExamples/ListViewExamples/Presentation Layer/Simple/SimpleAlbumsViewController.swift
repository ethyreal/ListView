//
//  SimpleAlbumsViewController.swift
//  ListViewExamples
//
//  Created by George Webster on 4/9/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import UIKit
import ETYListView

class SimpleAlbumsViewController: UIViewController, Stackable {
    
    let albums:[Album]
    
    init(artist:Artist) {
        self.albums = artist.albums
        super.init(nibName: nil, bundle: nil)
        self.title = artist.name + "'s Albums"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.makeStackView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let list = ListView(items:self.albums) { (cell:SimpleListCell, item) in
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = String(describing:item.year)
        }
        
        self.addArrangedSubview(list)
    }
}

