//
//  Menu.swift
//  ListViewExamples
//
//  Created by George Webster on 4/7/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import Foundation

struct Artist {
    let name:String
    let age:Int
    let birthName:String
    let yearsActive:String
    
    let albums:[Album]
}

extension Artist {
    
    init?(json:JSONDictionary) {
        
        guard let name = json[JSON.Artists.Key.name] as? String else { return nil }
        guard let age = json[JSON.Artists.Key.age] as? Int else { return nil }
        guard let birthName = json[JSON.Artists.Key.birthName] as? String else { return nil }
        guard let yearsActive = json[JSON.Artists.Key.yearsActive] as? String else { return nil }
        guard let albumsJson = json[JSON.Artists.Key.albums] as? [JSONDictionary] else { return nil }


        let albums = albumsJson.flatMap { Album(json:$0) }

        self.init(name: name, age: age, birthName: birthName, yearsActive: yearsActive, albums: albums)
    }
}

