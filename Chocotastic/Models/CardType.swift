//
//  CardType.swift
//
//  Created by Daniele Freitas on 01/09/19.
//

import UIKit

enum CardType {
  case
  unknown,
  amex,
  mastercard,
  visa,
  discover
  
  //https://en.wikipedia.org/wiki/Payment_card_number
  static func fromString(string: String) -> CardType {
    guard !string.isEmpty else {
      return .unknown
    }
    
    guard string.areAllCharactersNumbers else {
      assertionFailure("One of these characters is not a number!")
      return .unknown
    }
    
    if string.hasPrefix("4") {
      return .visa
    }
    
    
    guard let firstTwo = string.integerValue(ofFirstCharacters: 2) else {
      return .unknown
    }
    
    switch firstTwo {
    case 51...55:
      return .mastercard
    case 65:
      return .discover
    case 34, 37:
      return .amex
    default:
      break
    }
    
    guard let firstThree = string.integerValue(ofFirstCharacters: 3) else {
      return .unknown
    }
    
    switch firstThree {
    case 644...649:
      return .discover
    default:
      break
    }
    
    
    guard let firstFour = string.integerValue(ofFirstCharacters: 4) else {
      return .unknown
    }
    
    switch firstFour {
    case 2221...2720:
      return .mastercard
    case 6011:
      return .discover
    default:
      break
    }
    
    guard let firstSix = string.integerValue(ofFirstCharacters: 6) else {
      return .unknown
    }
    
    switch firstSix {
    case 622126...622925:
      return .discover
    default:
      return .unknown
    }
  }
  
  var expectedDigits: Int {
    switch self {
    case .amex:
      return 15
    default:
      return 16
    }
  }
  
  var image: UIImage? {
    switch self {
    case .amex:
      return ImageName.amex.image
    case .discover:
      return ImageName.discover.image
    case .mastercard:
      return ImageName.mastercard.image
    case .visa:
      return ImageName.visa.image
    case .unknown:
      return ImageName.unknownCard.image
    }
  }
  
  var cvvDigits: Int {
    switch self {
    case .amex:
      return 4
    default:
      return 3
    }
  }
  
  func format(noSpaces: String) -> String {
    guard noSpaces.count >= 4 else {
      return noSpaces
    }
    
    
    let startIndex = noSpaces.startIndex
    
    
    let index4 = noSpaces.index(startIndex, offsetBy: 4)
    let firstFour = String(noSpaces.prefix(upTo: index4))
    var formattedString = firstFour + " "
    
    switch self {
    case .amex:
      guard noSpaces.count > 10 else {
        return formattedString + String(noSpaces.suffix(from: index4))
      }
      
      
      let index10 = noSpaces.index(startIndex, offsetBy: 10)
      let nextSix = String(noSpaces[index4..<index10])
      let remaining = String(noSpaces.suffix(from: index10))
      return formattedString + nextSix + " " + remaining
    default:
      guard noSpaces.count > 8 else {
        return formattedString + String(noSpaces.suffix(from: index4))
      }
      
      let index8 = noSpaces.index(startIndex, offsetBy: 8)
      let nextFour = String(noSpaces[index4..<index8])
      formattedString += nextFour + " "
      
      guard noSpaces.count > 12 else {
        let remaining = String(noSpaces.suffix(from: index8))
        return formattedString + remaining
      }
      
      let index12 = noSpaces.index(startIndex, offsetBy: 12)
      let followingFour = String(noSpaces[index8..<index12])
      let remaining = String(noSpaces.suffix(from: index12))
      return formattedString + followingFour + " " + remaining
    }
  }
}
