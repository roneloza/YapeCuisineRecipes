//
//  DishView.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 13/11/22.
//

import SwiftUI

struct DishView: View {
    
    let dish: CuisineReceipeModel
    let size: CGSize
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: dish.image ?? "")){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .scaledToFill()
            .cornerRadius(12)
            VStack {
                Spacer()
                Text(dish.label ?? "")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .frame(width: self.size.width, height: self.size.height)
    }
}

struct DishView_Previews: PreviewProvider {
    static var previews: some View {
        DishView(dish: CuisineReceipeModel(
            label: "Chicken Vesuvio",
            ingredients: [
                CuisineIngredientModel(text: "1/2 cup olive oil",
                                       food: "olive oil",
                                       image: "https://www.edamam.com/food-img/4d6/4d651eaa8a353647746290c7a9b29d84.jpg")],
            image: "https://www.edamam.com/food-img/4d6/4d651eaa8a353647746290c7a9b29d84.jpg"),
                 size: .init(width: 140, height: 140))
    }
}
