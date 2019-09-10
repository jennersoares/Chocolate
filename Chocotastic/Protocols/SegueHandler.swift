//
//  SegueHandler.swift
//
//  Created by Daniele Freitas on 01/09/19.
//

import UIKit

protocol SegueHandler {
  associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandler
    where Self: UIViewController,
    SegueIdentifier.RawValue == String { 
  func performSegue(withIdentifier identifier: SegueIdentifier, sender: AnyObject? = nil) {
    performSegue(withIdentifier: identifier.rawValue, sender: sender)
  }
  
  func identifier(forSegue segue: UIStoryboardSegue) -> SegueIdentifier {
    guard
      let stringIdentifier = segue.identifier,
      let identifier = SegueIdentifier(rawValue: stringIdentifier)
      else {
        fatalError("Couldn't find identifier for segue!")
    }
    
    return identifier
  }
}
