//
//  ViperViewController.swift
//
//  Created by  Кирилл on 21.08.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import Foundation
import UIKit
import ActionSheetPicker_3_0

protocol ViperViewInputProtocol: AnyObject {
    func setupInitialState(with viewModel: ViperViewModel)
    func updateViewState(with viewModel: ViperViewModel)
    func updateViewState(with viewModel: ViperViewModel, animated: Bool)
    
    func beginLoading()
    func finishLoading(with error: Error?)
    
    func show(title: String?, message: String?, animated: Bool)
    func show(_ alertController: UIAlertController, animated: Bool)
    func show(_ picker: AbstractActionSheetPicker)
}

protocol ViperViewOutputProtocol: AnyObject {
    func viewIsReady(_ controller: UIViewController)
    
    func loadData()
    func reloadData()
    
    func goBack(_ controller: UIViewController, animated: Bool)
    func close(_ controller: UIViewController, animated: Bool)
}

class ViperViewController: UIViewController, ViperViewInputProtocol {
    
    // MARK: - Props
    public var _output: ViperViewOutputProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self._output?.viewIsReady(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    // MARK: - ViperViewInputProtocol
    open func setupInitialState(with viewModel: ViperViewModel) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title = viewModel.navigationTitle
    }
    
    open func updateViewState(with viewModel: ViperViewModel) { }
    
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
    
    public func show(title: String?, message: String?, animated: Bool) {
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
    
    public func show(_ alertController: UIAlertController, animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: animated, completion: nil)
        }
    }
    
    public func show(_ picker: AbstractActionSheetPicker) {
        DispatchQueue.main.async {
            picker.show()
        }
    }
    
}