//
//  ViperRouter.swift
//
//  Created by  Кирилл on 21.08.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import Foundation
import UIKit

public protocol ViperRouterInputProtocol: AnyObject {
    func dismiss(_ viewController: UIViewController, animated: Bool)
    func goBack(from viewController: UIViewController, animated: Bool)
    func goToRoot(from viewController: UIViewController, animated: Bool)
}

open class ViperRouter: ViperRouterInputProtocol {
    
    // MARK: - Initialization
    public init() { }
    
    open func present(_ viewController: UIViewController, from parentController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            parentController.present(viewController, animated: animated, completion: nil)
        }
    }
    
    open func push(to viewController: UIViewController, from parentController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            parentController.navigationController?.pushViewController(viewController, animated: animated)
        }
    }
    
    open func dismiss(_ viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            viewController.dismiss(animated: animated, completion: nil)
        }
    }
    
    open func goBack(from viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            viewController.navigationController?.popViewController(animated: animated)
        }
    }
    
    open func goToRoot(from viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            viewController.navigationController?.popToRootViewController(animated: animated)
        }
    }
    
}
