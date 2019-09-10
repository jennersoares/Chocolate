//
//  Chocolate.swift
//
//  Created by Daniele Freitas on 01/09/19.
//

import Foundation

//MARK: - Mmmm...chocolate...
struct Chocolate: Equatable, Hashable {
  let priceInDollars: Float
  let countryName: String
  let countryFlagEmoji: String
  
  // An array of chocolate from europe
  static let ofEurope: [Chocolate] = {
    let belgian = Chocolate(priceInDollars: 8,
                            countryName: "Belgica",
                            countryFlagEmoji: "🇧🇪")
    let british = Chocolate(priceInDollars: 7,
                            countryName: "Inglaterra",
                            countryFlagEmoji: "🇬🇧")
    let dutch = Chocolate(priceInDollars: 8,
                          countryName: "Holanda",
                          countryFlagEmoji: "🇳🇱")
    let german = Chocolate(priceInDollars: 7,
                           countryName: "Alemanha", countryFlagEmoji: "🇩🇪")
    let swiss = Chocolate(priceInDollars: 10,
                          countryName: "Suiça",
                          countryFlagEmoji: "🇨🇭")
    
    return [belgian,
            british,
            dutch,
            german,
            swiss]
  }()
}
