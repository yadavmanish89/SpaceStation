//
//  ViewController.swift
//  ISStation
//
//  Created by manish yadav on 2/11/23.
//

import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController, AlertProtocol {
    @IBOutlet weak var mapView: MKMapView!
    var viewModel: LocationViewModel?
    let regionInMeters: Double = 2000000
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        fetchISSLocation()
        mapView.register(MKAnnotationView.self, forAnnotationViewWithReuseIdentifier: "customannotation")
    }
    private func bindViewModel() {
        self.viewModel?.updateUI = { [weak self] in
            self?.locateOnMap()
        }
        self.viewModel?.showError = { [weak self] errorMessage in
            print("Show error message:\(errorMessage)")
            DispatchQueue.main.async {
                self?.showAlert(title: "Error", message: errorMessage)
            }
        }
    }
    private func fetchISSLocation() {
        let request = APIRequest(type: RequestType(0))
        viewModel?.fetchLocation(request: request)
    }
    private func locateOnMap() {
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
        let annotation = MKPointAnnotation()
        annotation.coordinate = coords
        DispatchQueue.main.async { [weak self] in
            self?.mapView.setRegion(region, animated: true)
            self?.mapView.addAnnotation(annotation)
        }
    }
}

extension LocationViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "customannotation", for: annotation)
        annotationView.image = UIImage(named: "ISSIcon")
        annotationView.canShowCallout = true
        return annotationView
    }
}
