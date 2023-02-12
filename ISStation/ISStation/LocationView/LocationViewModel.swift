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
    
    
    /// updateUI with params Latitude and logitude
    var updateUI: (() -> ())?
    /// To present error alert
    var showError: ((String) -> ())?
    /// Fetch Location
    /// - Parameter request: url to fetch location
    func fetchLocation(request: APIRequest) {
        
        self.networkManager.request(request) { [weak self] data in
            debugPrint("**Success**")
            self?.dataModel = JsonParser.getModelFor(data: data, model: LocationModel.self)
            self?.updateUI?()
        } error: { error in
            debugPrint("**Error**:\(error)")
        }

    }
    func getCoordinates() -> (latitude: String?,
                              longitude: String?) {
        return (dataModel?.iss_position.latitude,
                dataModel?.iss_position.longitude)
    }
}
