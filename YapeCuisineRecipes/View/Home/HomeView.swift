//
//  HomeView.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 13/11/22.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    let dishViewSize = CGSize(width: 100, height: 120)
    @ObservedObject var viewModel = HomeViewModel()
    var columns: [GridItem] {
        [
            GridItem(.adaptive(minimum: self.dishViewSize.width,
                               maximum: self.dishViewSize.height))
        ]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: self.$viewModel.categoryTag) {
                    ForEach(self.viewModel.category.indices) { i in
                        Text(self.viewModel.category[i]).tag(i)
                    }
                }
                .pickerStyle(.segmented)
                Spacer()
                ScrollView {
                    LazyVGrid(columns: self.columns, spacing: 16) {
                        ForEach(self.viewModel.receipes, id: \.self) { receipe in
                            NavigationLink(
                                destination: DetailView(dish: receipe)) {
                                DishView(dish: receipe,
                                         size: self.dishViewSize)
                            }
                        }
                    }
                }
            }
            .searchable(text: self.$viewModel.searchText)
            .navigationTitle("Cuisine")
        }
        .onReceive(
            self.viewModel.$searchText.debounce(
                for: 1,
                   scheduler: RunLoop.main)
        ) { searchText in
            Task {
                await self.viewModel.searchResults(searchText: searchText)
            }
        }
        .onReceive(self.viewModel.$categoryTag) { tag in
            Task {
                await self.viewModel.searchResults()
            }
        }
    }
    
    init() {
        let presenter: HomeInteractorOutput = HomePresenter(
            viewModel: self.viewModel)
        let interactor: HomeInteractorInput = HomeInteractor(
            output: presenter,
            dataManager: HomeDataManager(dataManager: NetworkDataManager()))
        self.viewModel.interactor = interactor
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
