//
//  ViperRouter.swift
//
//  Created by  Кирилл on 21.08.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import Foundation
import UIKit

protocol ViperRouterInputProtocol: AnyObject {
    func dismiss(_ viewController: UIViewController, animated: Bool)
    func goBack(from viewController: UIViewController, animated: Bool)
    func goToRoot(from viewController: UIViewController, animated: Bool)
}

class ViperRouter: ViperRouterInputProtocol {
    
    public func present(_ viewController: UIViewController, from parentController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            parentController.present(viewController, animated: animated, completion: nil)
        }
    }
    
    public func push(to viewController: UIViewController, from parentController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            parentController.navigationController?.pushViewController(viewController, animated: animated)
        }
    }
    
    func dismiss(_ viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            viewController.dismiss(animated: animated, completion: nil)
        }
    }
    
    func goBack(from viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            viewController.navigationController?.popViewController(animated: animated)
        }
    }
    
    func goToRoot(from viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            viewController.navigationController?.popToRootViewController(animated: animated)
        }
    }
    
}
