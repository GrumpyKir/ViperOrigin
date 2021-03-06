//
//  ViperViewController.swift
//
//  Created by  Кирилл on 21.08.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import Foundation
import UIKit

public protocol ViperViewInputProtocol: AnyObject {
    func setupInitialState(with viewModel: ViperViewModel)
    func updateViewState(with viewModel: ViperViewModel, animated: Bool)
    
    func beginLoading()
    func finishLoading(with error: Error?)
    
    func show(title: String?, message: String?, animated: Bool)
    func show(_ alertController: UIAlertController, animated: Bool)
}

public extension ViperViewInputProtocol {
    
    func updateViewState(with viewModel: ViperViewModel, animated: Bool = false) {
        return self.updateViewState(with: viewModel, animated: animated)
    }
    
}

public protocol ViperViewOutputProtocol: AnyObject {
    func viewIsReady(_ controller: UIViewController)
    
    func loadData()
    func reloadData()
    
    func goBack(animated: Bool)
    func close(animated: Bool)
}

open class ViperViewController: UIViewController, ViperViewInputProtocol {
    
    // MARK: - Props
    public var _output: ViperViewOutputProtocol?
    
    // MARK: - Lifecycle
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self._output?.viewIsReady(self)
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    // MARK: - ViperViewInputProtocol
    open func setupInitialState(with viewModel: ViperViewModel) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title = viewModel.navigationTitle
    }
    
    public func updateViewState(with viewModel: ViperViewModel) {
        self.updateViewState(with: viewModel, animated: false)
    }
    
    open func updateViewState(with viewModel: ViperViewModel, animated: Bool) { }
    
    open func beginLoading() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    open func finishLoading(with error: Error?) {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
        if let error = error {
            self.show(title: "Error".localized,
                      message: error.localizedDescription,
                      animated: true)
        }
    }
    
    open func show(title: String?, message: String?, animated: Bool) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ОК".localized,
                                     style: .default,
                                     handler: nil)
        alertController.addAction(okAction)
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: animated, completion: nil)
        }
    }
    
    open func show(_ alertController: UIAlertController, animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: animated, completion: nil)
        }
    }
    
}
