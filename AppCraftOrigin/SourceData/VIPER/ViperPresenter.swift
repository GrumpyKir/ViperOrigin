//
//  ViperPresenter.swift
//
//  Created by  Кирилл on 21.08.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import Foundation
import UIKit

public protocol ViperPresenterInputProtocol: AnyObject {
    var _view: ViperViewInputProtocol? { get set }
    var _interactor: ViperInteractorInputProtocol? { get set }
    var _router: ViperRouterInputProtocol? { get set }
    
    func configure(with data: Any?)
    func updateViewModel(with data: Any)
}

open class ViperPresenter: ViperPresenterInputProtocol, ViperViewOutputProtocol, ViperInteractorOutputProtocol {
    
    // MARK: - Props
    public var _view: ViperViewInputProtocol?
    public var _interactor: ViperInteractorInputProtocol?
    public var _router: ViperRouterInputProtocol?
    
    // MARK: - Initialization
    public init() { }
    
    // MARK: - ViperPresenterInputProtocol
    open func configure(with data: Any?) { }
    
    open func updateViewModel(with data: Any) { }
    
    // MARK: - ViperViewOutputProtocol
    open func viewIsReady(_ controller: UIViewController) { }
    
    open func loadData() { }
    
    open func reloadData() { }
        
    open func goBack(animated: Bool) {
        self._router?.goBack(animated: animated)
    }
    
    open func close(animated: Bool) {
        self._router?.dismiss(animated: animated)
    }
    
    // MARK: - ViperInteractorOutputProtocol
    open func beginLoading() {
        self._view?.beginLoading()
    }
    
    open func finishLoading(with error: Error?) {
        self._view?.finishLoading(with: error)
    }
    
    open func provideMessage(_ title: String?, message: String?) {
        self._view?.show(title: title, message: message, animated: true)
    }
    
}
