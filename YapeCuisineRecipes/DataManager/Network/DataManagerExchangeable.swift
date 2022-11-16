//
//  DataManagerExchangeable.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 12/11/22.
//

import Foundation

protocol DataManagerExchangeable {
    
    func fetch<T: Codable>(request: DataManagerExchangeRequest,
                         completion: @escaping (Result<T, HomeDataManagerError>) -> ())
}
