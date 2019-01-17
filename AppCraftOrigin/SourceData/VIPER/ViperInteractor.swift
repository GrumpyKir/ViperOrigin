//
//  ViperInteractor.swift
//
//  Created by  Кирилл on 21.08.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public protocol ViperInteractorInputProtocol: AnyObject {
    var _output: ViperInteractorOutputProtocol? { get set }
    
    func configure(with data: Any?)
}

public protocol ViperInteractorOutputProtocol: AnyObject {
    func finishLoading(with error: Error?)
    func setupData(with data: Any)
}

open class ViperInteractor: ViperInteractorInputProtocol {
    
    // MARK: - Props
    public var networkWorker: NetworkWorker
    
    public var _output: ViperInteractorOutputProtocol?
    
    // MARK: - Initialization
    public init() {
        self.networkWorker = NetworkWorker()
    }

    // MARK: - ViperInteractorInputProtocol
    open func configure(with data: Any?) { }
    
}
