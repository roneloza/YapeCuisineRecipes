//
//  CuisineReceipe.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 12/11/22.
//

import Foundation

struct CuisineReceipe: Codable {
    
    let label: String?
    let ingredients: [CuisineIngredient]?
    let image: String?
}
