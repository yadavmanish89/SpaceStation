//
//  LocationViewModel.swift
//  ISStation
//
//  Created by manish yadav on 2/11/23.
//

import Foundation

class LocationViewModel {
    private var dataModel: LocationModel?
    let networkManager: NetworkManager
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    /// To update UI on successful response
    var updateUI: (() -> ())?
    /// To present error alert
    var showError: ((String) -> ())?
    /// Fetch Location
    /// - Parameter request: url to fetch location
    func fetchLocation(urlString: APIRequest) {
        
        self.networkManager.request(urlString) { data in
            
        }
    }
}
