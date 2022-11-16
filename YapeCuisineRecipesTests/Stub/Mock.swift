//
//  Mock.swift
//  YapeCuisineRecipesTests
//
//  Created by Rone Shender Loza Aliaga on 14/11/22.
//

import Foundation

protocol Mock {
    
    var accept: ((_ params: Any...) -> ())? { get }
}
