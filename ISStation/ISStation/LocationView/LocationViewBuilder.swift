//
//  LocationViewBuilder.swift
//  ISStation
//
//  Created by manish yadav on 2/11/23.
//

import Foundation
import UIKit

class LocationViewBuilder {
    static func buildLocationView() -> UIViewController? {
        let networkManager = NetworkManager()
        
        let viewModel = LocationViewModel(networkManager: networkManager)
        guard let viewController = getViewController(identifier: "LocationViewController", fromStoryBoard: "Main") as? LocationViewController else {
            return nil
        }
        viewController.viewModel = viewModel
        return viewController
        func getViewController(identifier: String, fromStoryBoard name: String) -> UIViewController {
            let storyBoard = UIStoryboard(name: name, bundle: Bundle.main)
            let viewController = storyBoard.instantiateViewController(withIdentifier: identifier)
            return viewController
        }
    }
}
