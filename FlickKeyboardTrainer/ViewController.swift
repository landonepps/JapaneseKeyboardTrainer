//
//  ViewController.swift
//  FlickKeyboardTrainer
//
//  Created by Landon Epps on 3/22/19.
//  Copyright © 2019 Landon Epps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let allCharacters: Set<String> = ["あ", "か", "さ", "た", "な", "は", "ま", "や", "ら", "わ"]
  var listOfCharacterChoices = Set<String>()
  
  @IBOutlet weak var currentCharacterLabel: UILabel!
  
  var currentCharacter: String {
    set {
      currentCharacterLabel.text = newValue
    }
    get {
      return currentCharacterLabel.text!
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setNewCharacter()
  }

  @IBAction func keyboardButtonPressed(_ sender: UIButton) {
    guard let keyText = sender.currentTitle else {
      return
    }
    
//    let delay = 0.2
//    NSObject.cancelPreviousPerformRequests(withTarget: self)
//    if keyText == currentCharacter {
//      // correct answer
//      changeColor(to: UIColor(named: "rightGreen")!)
//      perform(#selector(changeColor(to:)), with: UIColor(named: "lightText")!, afterDelay: delay)
//      DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//        self.changeCharacter()
//      }
//    } else {
//      // wrong answer
//      changeColor(to: UIColor(named: "wrongRed")!)
//      perform(#selector(changeColor(to:)), with: UIColor(named: "lightText")!, afterDelay: delay)
//    }

    if keyText == currentCharacter {
      // correct answer
      currentCharacterLabel.textColor = UIColor(named: "rightGreen")!

      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        self.currentCharacterLabel.textColor = UIColor(named: "lightText")!
        self.setNewCharacter()
      }
    } else {
      // wrong answer
      // TODO: Refactor this
      currentCharacterLabel.textColor = UIColor(named: "wrongRed")!

      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        self.currentCharacterLabel.textColor = UIColor(named: "lightText")!
      }
    }
  }
  
//  @objc
//  func changeColor(to color: UIColor) {
//    currentCharacterLabel.textColor = color
//  }
  
  func setNewCharacter() {
    // if there's only one left (or zero), reset the choices
    if listOfCharacterChoices.count <= 1 {
      listOfCharacterChoices = allCharacters
    }
    // and remove the last choice
    // if we reset the choices, this will also make sure it won't
    // show the same character twice
    listOfCharacterChoices.remove(currentCharacter)
    
    self.currentCharacter = listOfCharacterChoices.randomElement()!
  }
}
