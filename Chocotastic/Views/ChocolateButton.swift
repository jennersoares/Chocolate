//
//  ChocolateButton.swift
//
//  Created by Daniele Freitas on 01/09/19.
//

import UIKit

@IBDesignable
class ChocolateButton: UIButton {
  override var isEnabled: Bool {
    didSet {
      updateAlphaForEnabledState()
    }
  }
  
  enum ButtonStyle {
    case
    standard,
    warning
  }
  
  @IBInspectable var isStandard: Bool = false {
    didSet {
      if isStandard {
        style = .standard
      } else {
        style = .warning
      }
    }
  }
  
  private var style: ButtonStyle = .standard {
    didSet {
      updateBackgroundColorForCurrentType()
    }
  }
  
  private func commonInit() {
    setTitleColor(.white, for: .normal)
    updateBackgroundColorForCurrentType()
    updateAlphaForEnabledState()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    commonInit()
  }
  
  func updateBackgroundColorForCurrentType() {
    switch style {
    case .standard:
      backgroundColor = .brown
    case .warning:
      backgroundColor = .red
    }
  }
  
  func updateAlphaForEnabledState() {
    if isEnabled {
      alpha = 1
    } else {
      alpha = 0.5
    }
  }
}
