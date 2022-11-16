//
//  MapView.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 15/11/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let coordinate: CLLocationCoordinate2D
    var places: [Marker] {
        [Marker(coordinate: self.coordinate)]
    }
    @State private var region: MKCoordinateRegion
    
    var body: some View {
        Map(coordinateRegion: self.$region,
            annotationItems: self.places) { (place) in
            MapMarker(coordinate: place.coordinate, tint: .red)
        }
            .edgesIgnoringSafeArea(.vertical)
    }
    
    init(coordinate: CLLocationCoordinate2D =
         CLLocationCoordinate2D(latitude: -12.046374,
                                longitude: -77.042793)) {
        self.coordinate = coordinate
        self.region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
