//
//  Json.swift
//  ListViewExamples
//
//  Created by George Webster on 4/8/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: Any]

enum JSON {
    
    enum Artists {
        enum Key {
            static let name = "name"
            static let age = "age"
            static let birthName = "birthName"
            static let yearsActive = "yearsActive"
            static let albums = "albums"
            static let artists = "artists"
        }
    }
    
    enum Albums {
        enum Key {
            static let title = "title"
            static let year = "year"
        }
    }
}

extension JSON {
    
    static func url(for fileName:String) -> Result<URL> {
        
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            return Result.failure(DataError.parsing)
        }
        
        return Result.success(fileURL)
    }
    
    static func data(from url:URL) -> Result<Data> {
        
        let data:Data
        
        do {
            data = try Data(contentsOf: url)
        }
        catch let error {
            return Result.failure(error)
        }
        
        return Result.success(data)
    }
    
    static func json(from data: Data) -> Result<JSONDictionary> {
        
        let json:JSONDictionary
        
        do {
            json = try JSONSerialization.jsonObject(with: data, options: []) as! JSONDictionary
        }
        catch let error {
            return Result.failure(error)
        }
        
        return Result.success(json)
    }
    
    static func artistsJson(from json:JSONDictionary) -> Result<[JSONDictionary]> {
        
        guard let artists = json[JSON.Artists.Key.artists] as? [JSONDictionary] else {
            return Result.failure(DataError.parsing)
        }
        
        return Result.success(artists)
    }
}
