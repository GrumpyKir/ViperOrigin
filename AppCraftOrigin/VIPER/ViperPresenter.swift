//
//  ViperPresenter.swift
//
//  Created by  Кирилл on 21.08.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import Foundation
import UIKit
import ActionSheetPicker_3_0

protocol ViperPresenterInputProtocol: AnyObject {
    var _view: ViperViewInputProtocol? { get set }
    var _interactor: ViperInteractorInputProtocol? { get set }
    var _router: ViperRouterInputProtocol? { get set }
    
    func configure(with data: Any?)
    func updateViewModel(with data: Any)
}

class ViperPresenter: ViperPresenterInputProtocol, ViperViewOutputProtocol, ViperInteractorOutputProtocol {
    
    // MARK: - Props
    var _view: ViperViewInputProtocol?
    var _interactor: ViperInteractorInputProtocol?
    var _router: ViperRouterInputProtocol?
    
    // MARK: - Initialization
    init() { }
    
    // MARK: - ViperPresenterInputProtocol
    func configure(with data: Any?) { }
    
    func updateViewModel(with data: Any) { }
    
    // MARK: - ViperViewOutputProtocol
    func viewIsReady(_ controller: UIViewController) { }
    
    func loadData() { }
    
    func reloadData() { }
        
    func goBack(_ controller: UIViewController, animated: Bool) {
        self._router?.goBack(from: controller, animated: animated)
    }
    
    func close(_ controller: UIViewController, animated: Bool) {
        self._router?.dismiss(controller, animated: animated)
    }
    
    // MARK: - ViperInteractorOutputProtocol
    func finishLoading(with error: Error?) {
        self._view?.finishLoading(with: error)
    }
    
    func setupData(with data: Any) { }
    
    func finishFavorite(instanceId: String) { }
    
}
