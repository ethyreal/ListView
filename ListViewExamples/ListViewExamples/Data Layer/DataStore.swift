//
//  DataStore.swift
//  ListViewExamples
//
//  Created by George Webster on 4/8/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import Foundation


class DataStore {
    
    func artists() -> [Artist] {

        let artistsJsonResult = JSON.url(for: "2016_artists")
            .flatMap(JSON.data)
            .flatMap(JSON.json)
            .flatMap(JSON.artistsJson)
        
        switch artistsJsonResult {
        case .success(let artistsJsons):
            return artistsJsons.flatMap { Artist(json: $0) }
        case .failure(_):
            return [Artist]()
        }
    }
}

