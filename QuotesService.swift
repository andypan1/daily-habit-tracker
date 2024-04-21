//
//  QuotesService.swift
//  Habit Tracker
//
//  Created by Andy Pan on 4/19/24.
//

import Foundation

class QuotesService{
    static func fetchQuotes(completion: ((CurrentQuote) -> Void)? = nil){
        let url = URL(string: "https://zenquotes.io/api/random")!
        let task = URLSession.shared.dataTask(with: url){data, response, error in
            guard error == nil else {
                    assertionFailure("Error: \(error!.localizedDescription)")
                    return
                  }
                  guard let httpResponse = response as? HTTPURLResponse else {
                    assertionFailure("Invalid response")
                    return
                  }
                  guard let data = data, httpResponse.statusCode == 200 else {
                    assertionFailure("Invalid response status code: \(httpResponse.statusCode)")
                    return
                  }
                do {
                    let quotesArray = try JSONDecoder().decode([CurrentQuote].self, from: data)
                        if let firstQuote = quotesArray.first {
                            DispatchQueue.main.async {                                    completion?(firstQuote)
                            }
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                }
        }
        task.resume()
    }
}
