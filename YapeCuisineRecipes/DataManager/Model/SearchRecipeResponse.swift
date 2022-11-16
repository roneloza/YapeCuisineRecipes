//
//  SearchRecipeResponse.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 13/11/22.
//

import Foundation

struct SearchResponse: Codable {
    
    let hits: [SearchRecipeResponse]?
}

struct SearchRecipeResponse: Codable {
    
    let recipe: CuisineReceipe?
}
