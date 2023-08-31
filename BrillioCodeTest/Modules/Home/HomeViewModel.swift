//
//  HomeViewModel.swift
//  BrillioCodeTest
//
//  Created by Luis Gutierrez Juarez on 29/08/23.
//

import Foundation

class HomeViewModel {
    var api: APIManager?
    
    //var bindIsRefreshing: ((Bool) -> Void)?
    var bindGetQuote: ((Quote) -> Void)?
    var bindingGetFail: ((String) -> Void)?

    
    func start() {
        api = APIManager()
        
    }
    
    func getQuoteData() {
        api?.performGetQuote(completion: { quote, error in
            if error == nil {
                if let quote = quote {
                    self.bindGetQuote?(quote)
                }
            } else {
                self.bindingGetFail?("There is an error please intent later")
            }
        })
    }
    
    
}
