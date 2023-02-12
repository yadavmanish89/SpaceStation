//
//  ViewController.swift
//  ISStation
//
//  Created by manish yadav on 2/11/23.
//

import UIKit
//import NetworkManager

class LocationViewController: UIViewController, AlertProtocol {
    var viewModel: LocationViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        locateISS()
    }

    private func bindViewModel() {
        self.viewModel?.updateUI = { [weak self] in
            let coordabc = self?.viewModel.getCoordinates()
            debugPrint("")
        }
        self.viewModel?.showError = { [weak self] errorMessage in
            print("Show error message:\(errorMessage)")
            //Reloading Tableview even if error case so tableview can update id ant steal data
            DispatchQueue.main.async {
                self?.showAlert(title: "Error", message: errorMessage)
            }
        }
    }
    
    private func locateISS() {
        let request = APIRequest(type: RequestType(0))
        viewModel.fetchLocation(request: request)
    }
}

