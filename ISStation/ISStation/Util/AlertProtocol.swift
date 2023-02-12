//
//  AlertProtocol.swift
//  ISStation
//
//  Created by manish yadav on 2/11/23.
//

import Foundation
import UIKit
protocol AlertProtocol {
    func showAlert(title: String, message: String)
}

extension AlertProtocol where Self: UIViewController {
    func showAlert(title: String, message: String){
        
    }
}
