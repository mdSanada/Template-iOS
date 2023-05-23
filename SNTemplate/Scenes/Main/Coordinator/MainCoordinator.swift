//
//  MyReceiptCoordinator.swift
//  SNMedicalTreatment
//
//  Created by Matheus D Sanada on 10/09/22.
//

import UIKit
class MainCoordinator: SNCoordinator {
    var presenter: UIViewController
    var child: SNCoordinator?
    let tabController: TabController
    
    let homeCoordinator: HomeCoordinator

    lazy var storyboard: UIStoryboard = {
        return .init(name: "MainStoryboard", bundle: nil)
    }()
    
    deinit {
        Sanada.print("Deinitializing \(self)")
    }

    init(with navigation: UINavigationController) {
        self.presenter = navigation
        homeCoordinator = HomeCoordinator()
        
        tabController = UIStoryboard(name: "MainStoryboard",
                                               bundle: nil)
            .instantiateInitialViewController() as! TabController

        tabController.interface = self
        self.navigation?.setNavigationBarHidden(true, animated: false)
        self.navigation?.pushViewController(tabController, animated: false)
    }

    func start() { }
    
    static func restartStack(navigation: UINavigationController = .init() ) {
        let coordinator = MainCoordinator(with: navigation)
        UIApplication.shared.keyWindow?.rootViewController = coordinator.presenter
    }

    func back() {
        self.navigation?.popViewController(animated: true)
    }
    
    func finish() {
        tabController.interface = nil
        homeCoordinator.parent = nil
        LoginCoordinator.restartStack()
    }
}

extension MainCoordinator: TabProtocol {    
    func getViewController(_ viewController: RootViewControllers) -> UIViewController? {
        switch viewController {
        case .home:
            homeCoordinator.parent = self
            return homeCoordinator.presenter
        }
    }
}
