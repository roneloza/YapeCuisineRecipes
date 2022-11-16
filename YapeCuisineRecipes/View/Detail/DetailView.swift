//
//  DetailView.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 15/11/22.
//

import SwiftUI
import MapKit

struct DetailView: View {
    
    let dish: CuisineReceipeModel
    var ingredients: [CuisineIngredientModel] {
        self.dish.ingredients?.compactMap { $0 } ?? []
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                AsyncImage(url: URL(string: self.dish.image ?? "")){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFill()
                .frame(height: 400)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(
                            destination: MapView(
                                coordinate: CLLocationCoordinate2D(latitude: -12.046374,
                                                                   longitude: -77.042793))) {
                                Image(systemName: "mappin.circle.fill")
                                    .resizable()
                                    .foregroundColor(.red)
                                    .frame(width: 40, height: 40)
                            }
                    }
                }
                .padding([.bottom, .trailing])
            }
            VStack {
                Spacer()
                VStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(self.dish.label ?? "")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                    }
                    HStack {
                        Text("Ingredientes:")
                        Spacer()
                    }
                    .padding(.vertical, 16)
                    ForEach(self.ingredients, id: \.self) { ingredient in
                        IngredientView(ingredient: ingredient)
                    }
                }
                .padding(.horizontal, 16)
            }
            Spacer()
        }
        .navigationTitle(Text(self.dish.label ?? ""))
        .edgesIgnoringSafeArea(.top)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(dish: CuisineReceipeModel(
            label: "Chicken Vesuvio",
            ingredients: [
                CuisineIngredientModel(text: "1/2 cup olive oil",
                                       food: "olive oil",
                                       image: "https://www.edamam.com/food-img/4d6/4d651eaa8a353647746290c7a9b29d84.jpg")],
            image: "https://www.edamam.com/food-img/4d6/4d651eaa8a353647746290c7a9b29d84.jpg"))
    }
}
