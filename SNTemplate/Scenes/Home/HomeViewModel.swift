//
//  HomeViewModel.swift
//  SNGoals
//
//  Created by Matheus D Sanada on 06/01/23.
//

import Foundation
import RxSwift
import RxCocoa

enum HomeStates: SNStateful {
    case initialize
    case loading(Bool)
    case error(String)
}

class HomeViewModel: SNViewModel<HomeStates> {
    var disposeBag = DisposeBag()
    
    deinit {
        Sanada.print("Deinitializing: \(self)")
        viewState.onCompleted()
    }

    override func configure() {
    }
}
