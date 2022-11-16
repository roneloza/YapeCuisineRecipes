//
//  DataManagerExchangeResponse.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 12/11/22.
//

import Foundation

protocol DataManagerExchangeResponse {
    
    associatedtype T
    var data: T { get }
}

struct ReceipeTopExchangeResponse: DataManagerExchangeResponse {
    typealias T = [CuisineReceipe]
    
    var data: [CuisineReceipe]
}
