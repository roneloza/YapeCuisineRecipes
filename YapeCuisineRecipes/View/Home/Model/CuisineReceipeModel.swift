//
//  CuisineReceipeModel.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 13/11/22.
//

import Foundation

struct CuisineReceipeModel: Hashable {
    
    static func == (lhs: CuisineReceipeModel, rhs: CuisineReceipeModel) -> Bool {
        rhs.label == lhs.label && rhs.image == lhs.image
    }
    
    let label: String?
    let ingredients: [CuisineIngredientModel]?
    let image: String?
    
    init(label: String?,
         ingredients: [CuisineIngredientModel]?,
         image: String?) {
        self.label = label
        self.ingredients = ingredients
        self.image = image
    }
    
    init(model: CuisineReceipe) {
        self.label = model.label
        self.ingredients = model.ingredients?.compactMap { CuisineIngredientModel(model: $0) } ?? []
        self.image = model.image
    }
}
