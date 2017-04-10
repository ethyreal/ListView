//
//  Album.swift
//  ListViewExamples
//
//  Created by George Webster on 4/8/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import Foundation

struct Album {
    let title:String
    let year:Int
}

extension Album {
    
    init?(json:JSONDictionary) {
        
        guard let title = json[JSON.Albums.Key.title] as? String else { return nil }
        guard let year = json[JSON.Albums.Key.year] as? Int else { return nil }

        self.init(title: title, year: year)
    }
}
