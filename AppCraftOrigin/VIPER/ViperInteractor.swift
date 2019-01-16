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
//    func perform<T: Codable>(_ request: URLRequest) -> T?
    
//    func select<T: NSManagedObject>(predicate: NSPredicate?) -> T?
//    func insert<T: NSManagedObject>(data: [String: Any]) -> T?
//    func update<T: NSManagedObject>(data: [String: Any], predicate: NSPredicate?) -> T?
//    func delete<T: NSManagedObject>(item: T)
//    func drop<T: NSManagedObject>() -> T?
}

public protocol ViperInteractorOutputProtocol: AnyObject {
    func finishLoading(with error: Error?)
    func setupData(with data: Any)
}

open class ViperInteractor: ViperInteractorInputProtocol {
//    private var networkWorker: NetworkWorker = NetworkWorker()
//    private var coreDataWorker: CoreDataWorker = CoreDataWorker()
    
    public var _output: ViperInteractorOutputProtocol?
    
    // MARK: - Initialization
    public init() { }

    open func configure(with data: Any?) { }
    
//    public func perform<T: Codable>(_ request: URLRequest) -> T? {
//        networkWorker.perform(request: request) { (result: T?, response, error) in
//            if error == nil, let receivedObject = result, let receivedResponse = response {
//                self.didFinishRequest(with: receivedObject, response: receivedResponse)
//            } else {
//                self.didFinishRequest(with: error)
//            }
//        }
//
//        return nil
//    }
//
//    public func select<T: NSManagedObject>(predicate: NSPredicate?) -> T? {
//        coreDataWorker.fetch(predicate: nil) { (result: [T]?, error) in
//            if let result = result, error == nil {
//                self.didFinishRequest(with: result)
//            }
//            else {
//                self.didFinishRequest(with: error)
//            }
//        }
//
//        return nil
//    }
//
//    public func insert<T: NSManagedObject>(data: [String: Any]) -> T? {
//        coreDataWorker.createItem(entityName: String.className(T.self)) { (item: T?, error) in
//            if let item = item, error == nil {
//                self.coreDataWorker.insert(item: item, data: data, completion: { (result, error) in
//                    if result, error == nil {
//                        print("COREDATA - TRUE")
//                    }
//                    else {
//                        print("COREDATA - FALSE")
//                    }
//                })
//            }
//            else {
//                print("COREDATA - FALSE")
//            }
//        }
//
//        return nil
//    }
//
//    public func update<T: NSManagedObject>(data: [String: Any], predicate: NSPredicate?) -> T? {
//        coreDataWorker.update(data: data, predicate: predicate) { (result: [T]?, error) in
//            if result != nil, error == nil {
//                print("COREDATA - TRUE")
//            }
//            else {
//                print("COREDATA - FALSE")
//            }
//        }
//
//        return nil
//    }
//
//    public func delete<T: NSManagedObject>(item: T) {
//        coreDataWorker.delete(item: item) { (result, error) in
//            if result, error == nil {
//                print("COREDATA - TRUE")
//            }
//            else {
//                print("COREDATA - FALSE")
//            }
//        }
//    }
//
//    public func drop<T: NSManagedObject>() -> T? {
//        //
//
//        return nil
//    }
    
//    open func didFinishRequest(with data: Any, response: URLResponse) {
//        _output?.finishLoading(with: nil)
//        _output?.setupData(with: data)
//    }
    
//    open func didFinishRequest(with data: Any) {
//        _output?.finishLoading(with: nil)
//        _output?.setupData(with: data)
//    }
//
//    open func didFinishRequest(with error: Error?) {
//        _output?.finishLoading(with: error)
//    }
    
}
