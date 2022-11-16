//
//  File.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 15/11/22.
//

import Foundation
import CoreLocation

struct Marker: Identifiable {
    
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
