//
//  ValidatingTextField.swift
//
//  Created by Daniele Freitas on 01/09/19.
//

import UIKit

class ValidatingTextField: UITextField {
  var valid: Bool = false {
    didSet {
      configureForValid()
    }
  }
  
  var hasBeenExited: Bool = false {
    didSet {
      configureForValid()
    }
  }
  
  override func resignFirstResponder() -> Bool {
    hasBeenExited = true
    return super.resignFirstResponder()
  }
  
  private func configureForValid() {
    if !valid && hasBeenExited {
      backgroundColor = .red
    } else {
      backgroundColor = .clear
    }
  }
}
