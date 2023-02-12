//
//  LocationModel.swift
//  ISStation
//
//  Created by manish yadav on 2/11/23.
//

import Foundation

struct LocationModel: Codable {
    var message: String
    var timestamp: Double
    var iss_position: LatitudeLongitudeModel
}

struct LatitudeLongitudeModel: Codable {
    var latitude: String
    var longitude: String
}
