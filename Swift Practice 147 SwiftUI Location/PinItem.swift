//
//  AnnotatedItem.swift
//  Swift Practice 147 SwiftUI Location
//
//  Created by Dogpa's MBAir M1 on 2022/4/16.
//

import MapKit
struct PinItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
    
}
