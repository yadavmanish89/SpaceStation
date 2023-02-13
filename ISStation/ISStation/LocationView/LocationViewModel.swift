//
//  LocationViewModel.swift
//  ISStation
//
//  Created by manish yadav on 2/11/23.
//

import Foundation

class LocationViewModel {
    private var dataModel: LocationModel?
    private var isUpdate: Bool = false
    var timer: DispatchSourceTimer!
    let networkManager: NetworkManager
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    /// updateUI with params Latitude and logitude
    var updateUI: (() -> ())?
    /// To present error alert
    var showError: ((String) -> ())?
    /// - Parameter
    /// - Parameters:
    ///   - request: url to fetch location
    ///   - repeats: flag for update location
    ///   - timeInterval: timeInterval in second to schedule update location
    func fetchLocation(request: APIRequest,
                       repeats: Bool,
                       timeInterval: DispatchTimeInterval) {
        isUpdate = repeats
        self.networkManager.request(request) { [weak self] data in
            debugPrint("**Success**")
            self?.dataModel = JsonParser.getModelFor(data: data, model: LocationModel.self)
            self?.updateUI?()
            if repeats {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + timeInterval) {
                    debugPrint("**---update---asyncAfter-----**:")
                    self?.fetchLocation(request: request,
                                  repeats: repeats,
                                  timeInterval: timeInterval)
                }
            }
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
