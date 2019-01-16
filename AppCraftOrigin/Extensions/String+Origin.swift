//
//  String+Origin.swift
//  Trade Union
//
//  Created by  Кирилл on 1/15/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last ?? ""
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}
