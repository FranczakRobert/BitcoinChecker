//
//  BitcoinManager.swift
//  BitcoinPrice
//
//  Created by Robert Franczak on 28/02/2023.
//

import Foundation
let coinManager = CoinManager()

struct BitcoinManager {
    
    func fetchPrice() {
//        let url = coinManager.baseURL
//        let key = coinManager.apiKey
        let urlString = "\(coinManager.baseURL)/PLN/?apikey=\(coinManager.apiKey)"
        print(urlString)
            //performRequest(with: urlString)
    }
    
    func performRequest(with URLString: String) {
        if let url = URL(string: URLString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                
                if error != nil {
                    print(error!)
                    return
                }
                if let safedata = data {
                    let dataString = String(data: safedata, encoding: .utf8)
                    print(dataString!)
                }
            }
            task.resume()
        }
    }
    
}
