//
//  IngredientView.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 15/11/22.
//

import SwiftUI

struct IngredientView: View {
    
    let ingredient: CuisineIngredientModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: self.ingredient.image ?? "")){ image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .scaledToFill()
                }
                .cornerRadius(8)
                .frame(width: 80, height: 80)
                Text(self.ingredient.text ?? "")
                Spacer()
            }
        }
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(ingredient:
                        CuisineIngredientModel(text: "1/2 cup olive oil",
                                               food: "olive oil",
                                               image: "https://www.edamam.com/food-img/4d6/4d651eaa8a353647746290c7a9b29d84.jpg"))
    }
}
