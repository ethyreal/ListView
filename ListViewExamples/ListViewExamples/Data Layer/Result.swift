//
//  Result.swift
//  ListViewExamples
//
//  Created by George Webster on 4/9/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

extension Result {
    
    func flatMap<U>(_ transform:(T) -> Result<U>) -> Result<U> {
        
        switch self {
        case let .success(value):
            return transform(value)
        case let .failure(error):
            return .failure(error)
        }
    }
}
