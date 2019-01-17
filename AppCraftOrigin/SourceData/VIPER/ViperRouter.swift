//
//  ViperRouter.swift
//
//  Created by  Кирилл on 21.08.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import Foundation
import UIKit

public protocol ViperRouterInputProtocol: AnyObject {
    var _mainController: UIViewController? { get set }
    
    func dismiss(animated: Bool)
    func goBack(animated: Bool)
    func goToRoot(animated: Bool)
}

open class ViperRouter: ViperRouterInputProtocol {
    
    // MARK: - Props
    public var _mainController: UIViewController?
    
    // MARK: - Initialization
    public init() { }
    
    // MARK: - ViperRouterInputProtocol
    open func dismiss(animated: Bool) {
        DispatchQueue.main.async {
            self._mainController?.dismiss(animated: animated, completion: nil)
        }
    }
    
    open func goBack(animated: Bool) {
        DispatchQueue.main.async {
            self._mainController?.navigationController?.popViewController(animated: animated)
        }
    }
    
    open func goToRoot(animated: Bool) {
        DispatchQueue.main.async {
            self._mainController?.navigationController?.popToRootViewController(animated: animated)
        }
    }
    
    // MARK: - Public functions
    public func present(_ viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            self._mainController?.present(viewController, animated: animated, completion: nil)
        }
    }
    
    public func push(to viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            self._mainController?.navigationController?.pushViewController(viewController, animated: animated)
        }
    }
        
}
