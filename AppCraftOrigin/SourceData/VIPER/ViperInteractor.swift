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
    
    // MARK: - Module functions
    open func execute<T: Codable>(_ request: URLRequest, onSuccess: @escaping (_ result: T?, _ response: URLResponse?) -> Void, onError: @escaping (_ error: Error?, _ response: URLResponse?) -> Void) -> T? {
        self.networkWorker.execute(request) { (result: T?, response, error) in
            self._output?.finishLoading(with: error)
            
            if let receivedResponse = response as? HTTPURLResponse {
                switch receivedResponse.statusCode {
                case 200:
                    onSuccess(result, receivedResponse)
                default:
                    onError(error, receivedResponse)
                }
            } else {
                onError(error, response)
            }
        }
        
        return nil
    }
}
