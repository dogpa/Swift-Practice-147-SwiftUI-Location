//
//  LocationViewModel.swift
//  Swift Practice 147 SwiftUI Location
//
//  Created by Dogpa's MBAir M1 on 2022/4/16.
//

import MapKit

enum MapDetails {
    static let originLocation = CLLocationCoordinate2D(latitude: 24.138419004819387, longitude: 121.27559334860734)
    static let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
}

final class LocationViewModel : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: MapDetails.originLocation, span: MapDetails.span)
    
    @Published var pinList = [
        PinItem(name: "爭艷館", coordinate: .init(latitude: 25.0697284745406, longitude:121.5207299230507)),
        PinItem(name: "圓山捷運站", coordinate: .init(latitude: 25.0713345677012, longitude:121.52007387964835)),
        PinItem(name: "台北美術館", coordinate: .init(latitude: 25.07276506251712, longitude:121.52493865773467)),
    ]
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled () {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        }else{
            print("可通知使用者去設定開啟地理位置權限")
        }
    }
    
    private func checkLocationAuthorization () {
        guard let locationManager = locationManager else {
            return
        }
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("你的地理位置權限受限")
        case .denied:
            print("你的地理位置沒有獲得你的允許，可至設定中開啟權限")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.span)
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
