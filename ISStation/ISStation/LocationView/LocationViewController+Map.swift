//
//  LocationViewController+Map.swift
//  ISStation
//
//  Created by manish yadav on 2/12/23.
//

import Foundation
import MapKit
import CoreLocation

extension LocationViewController {
    func locateOnMap() {
       guard let coordinates = self.viewModel?.getCoordinates(),
             let latString = coordinates.latitude,
             let longString = coordinates.longitude,
             let lat = CLLocationDegrees(latString),
             let long = CLLocationDegrees(longString) else {
           return
       }
           let coords = CLLocationCoordinate2D(latitude: lat, longitude: long)
       let region = MKCoordinateRegion(center: coords,
                                       latitudinalMeters: self.regionInMeters,
                                       longitudinalMeters: self.regionInMeters)
       let annotation: MKPointAnnotation = self.mapView.annotations.first { anna in
           (anna as? MKPointAnnotation) != nil
       } as? MKPointAnnotation ?? MKPointAnnotation()
       annotation.coordinate = coords
       DispatchQueue.main.async { [weak self] in
           self?.mapView.setRegion(region, animated: true)
           self?.mapView.addAnnotation(annotation)
       }
   }
}
extension LocationViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = mapView.dequeueReusableAnnotationView(
            withIdentifier: annotationReuseIdentifier,
            for: annotation)
        annotationView.image = UIImage(named: "ISSIcon")
        return annotationView
    }
}

