//
//  ViewController.swift
//  ISStation
//
//  Created by manish yadav on 2/11/23.
//

import UIKit
import MapKit

class LocationViewController: UIViewController, AlertProtocol {
    @IBOutlet weak var mapView: MKMapView!
    var viewModel: LocationViewModel?
    let regionInMeters: Double = 3000000
    let annotationReuseIdentifier = "customannotation"
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        fetchISSLocation()
        registerAnnotationView()
    }
    func registerAnnotationView() {
        mapView.register(MKAnnotationView.self,
                         forAnnotationViewWithReuseIdentifier: annotationReuseIdentifier)
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
        viewModel?.fetchLocation(request: request,
                                 repeats: true,
                                 timeInterval: .seconds(3))
    }
    
}
