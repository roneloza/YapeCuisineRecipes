//
//  CuisineIngredientModel.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 14/11/22.
//

import Foundation

struct CuisineIngredientModel: Hashable {
    
    let text: String?
    let food: String?
    let image: String?
    
    init(text: String?,
         food: String?,
         image: String?) {
        self.text = text
        self.food = food
        self.image = image
    }
    
    init(model: CuisineIngredient) {
        self.text = model.text
        self.food = model.food
        self.image = model.image
    }
}
