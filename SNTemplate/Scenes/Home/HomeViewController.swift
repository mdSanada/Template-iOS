//
//  TreatmentViewController.swift
//  SNMedicalTreatment
//
//  Created by Matheus D Sanada on 27/09/22.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: SNViewController<HomeStates, HomeViewModel> {
    var delegate: HomeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureBindings() {
    }
    
    override func render(states: HomeStates) {
        
    }
}
