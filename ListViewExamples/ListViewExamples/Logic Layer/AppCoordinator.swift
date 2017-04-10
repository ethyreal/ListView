//
//  AppCoordinator.swift
//  ListViewExamples
//
//  Created by George Webster on 4/7/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    let nav:UINavigationController
    let dataStore = DataStore()
    
    init(window:UIWindow) {
        self.nav = UINavigationController()
        window.rootViewController = self.nav
    }
    
    func start() {
        self.showMenuController()
    }
    
    func showMenuController() {

        let vc = MenuViewController(items:MenuItem.all())
        vc.didSelect = { [unowned self] item in
            self.showController(for: item.itemType)
        }
        self.nav.viewControllers = [vc]
    }
    
    func showController(for itemType:MenuItemType) {
        
        switch itemType {
        case .simple: self.showSimpleArtistController() ; return
        case .multiCell: self.showMultiCellController() ; return
        case .multiSection: self.showMultiSectionController() ; return
        }
    }
    
    func showSimpleArtistController() {
      
        let artists = self.dataStore.artists()
        let vc = SimpleArtistViewController(artists: artists)
        vc.didSelect = { [unowned self] artist in
            self.showSimpleAlbumController(with: artist)
        }
        self.nav.pushViewController(vc, animated: true)
    }

    func showSimpleAlbumController(with artist:Artist) {
        
        let vc = SimpleAlbumsViewController(artist: artist)

        self.nav.pushViewController(vc, animated: true)
    }

    func showMultiCellController() {
        
    }
    
    func showMultiSectionController() {
        
    }
}
