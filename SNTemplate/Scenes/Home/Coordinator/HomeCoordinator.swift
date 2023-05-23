//
//  HomeCoordinator.swift
//  SNMedicalTreatment
//
//  Created by Matheus D Sanada on 27/09/22.
//

import UIKit

class HomeCoordinator: SNCoordinator {
    var parent: MainCoordinator?
    var presenter: UIViewController
    var child: SNCoordinator?
        
    lazy var storyboard: UIStoryboard = {
        return .init(name: "MainStoryboard", bundle: nil)
    }()
    
    deinit {
        Sanada.print("Deinitializing \(self)")
    }

    init() {
        let viewModel = HomeViewModel()
        guard let viewController = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(withIdentifier: "Home") as? HomeViewController else {
            presenter = UINavigationController()
            return
        }
        viewController.set(viewModel: viewModel)
        
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.tabBarItem.image = UIImage.init(systemName: "waveform")
        navigation.tabBarItem.title = "Home"
        navigation.navigationBar.prefersLargeTitles = true
        viewController.title = "Home"
        
        self.presenter = navigation
        viewController.delegate = self
    }

    func start() {
    }

    func back() {
        self.navigation?.popViewController(animated: true)
    }
}
extension HomeCoordinator: HomeProtocol, SNCoordinatorDismissable {
    func dismissing() {
        child = nil
    }
}
