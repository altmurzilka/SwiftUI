//
//  CalculatePrime.swift
//  ConcurrencyTest
//
//  Created by Алтын on 7/22/20.
//

import Foundation

struct Clue : Codable, Identifiable {
    var id : Int
    var answer : String
    var question : String
    var value : Int
    var cat : Category
}

struct Category : Codable, Identifiable {
    let id : Int
    let title : String
    let clues_count : Int
    
    enum CodingKeys: String, CodingKey {
      case id
      case title
      case clues_count
    }
}
