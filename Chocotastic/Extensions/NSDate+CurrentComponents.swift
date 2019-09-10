//
//  NSDate+CurrentComponents.swift
//
//  Created by Daniele Freitas on 01/09/19.
//

import Foundation

extension Date {
  var year: Int {
    return Calendar(identifier: .gregorian).component(.year, from: self)
  }
  
  var month: Int {
    return Calendar(identifier: .gregorian).component(.month, from: self)
  }
}
