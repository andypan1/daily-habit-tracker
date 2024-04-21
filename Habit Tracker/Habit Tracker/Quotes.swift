//
//  Quotes.swift
//  Habit Tracker
//
//  Created by Andy Pan on 4/19/24.
//

import Foundation
import UIKit

struct QuotesAPIResponse: Decodable{
    let currentquote: CurrentQuote
    
    private enum CodingKeys: String, CodingKey{
        case currentquote
    }
}

struct CurrentQuote: Codable {
    let text: String
    let name: String
    
    private enum CodingKeys: String, CodingKey{
        case text = "q"
        case name = "a"
    }
}
