//
//  TabProtocol.swift
//  SNMedicalTreatment
//
//  Created by Matheus D Sanada on 14/09/22.
//

import Foundation
import UIKit

enum RootViewControllers {
    case home
}

protocol TabProtocol: AnyObject {
    func getViewController(_ viewController: RootViewControllers) -> UIViewController?
}
