//
//  ContentView.swift
//  Swift Practice 147 SwiftUI Location
//
//  Created by Dogpa's MBAir M1 on 2022/4/16.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @StateObject private var locationVM = LocationViewModel()
    var body: some View {
        
        Map(coordinateRegion: $locationVM.region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: locationVM.pinList) { item in
            MapMarker(coordinate: item.coordinate, tint: .red)
        }
            .ignoresSafeArea()
            .accentColor(.cyan)
            .onAppear {
                locationVM.checkIfLocationServicesIsEnabled()
            }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
