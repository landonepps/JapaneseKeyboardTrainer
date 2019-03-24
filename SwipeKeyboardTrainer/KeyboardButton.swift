//
//  KeyboardButton.swift
//  SwipeKeyboardTrainer
//
//  Created by Landon Epps on 3/23/19.
//  Copyright © 2019 Landon Epps. All rights reserved.
//

import UIKit

@IBDesignable
class KeyboardButton: UIButton {
  @IBInspectable var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue > 0
    }
  }
  
  @IBInspectable var borderWidth: CGFloat {
    get {
      return layer.borderWidth
    }
    set {
      layer.borderWidth = newValue
    }
  }
  
  @IBInspectable var borderColor: UIColor? {
    get {
      return layer.borderColor != nil ? UIColor(cgColor: layer.borderColor!) : nil
    }
    set {
      layer.borderColor = newValue?.cgColor
    }
  }
}
