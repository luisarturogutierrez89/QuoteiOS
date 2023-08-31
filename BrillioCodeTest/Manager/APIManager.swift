//
//  APIManager.swift
//  BrillioCodeTest
//
//  Created by Luis Gutierrez Juarez on 29/08/23.
//

import Foundation

class APIManager {
    
    func performGetQuote(completion:@escaping(Quote?, Error?) -> Void) {
        
        guard let url = URL(string: APIEnpoints.quote.rawValue) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "", code: 404))
                return
            }
            
            do {
                let coder = JSONDecoder()
                let quote = try coder.decode(Quote.self, from: data)
                completion(quote, nil)
            } catch let decodeError {
                 completion(nil, decodeError)
            }
        }
        
        task.resume()
    }
    
    enum APIEnpoints: String {
        case quote = "https://api.quotable.io/random"
    }
    
}
