//
//  coinManager.swift
//  BitcoinPrice
//
//  Created by Robert Franczak on 28/02/2023.
//

import Foundation


protocol CoinManagerDelegate {
    func didUserPickNewCurrency(with data: String)
}

struct CoinManager {
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey  = "1336804A-D226-4F17-9627-F2BA91AE6D6E"
    var delegate : CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)/?apikey=\(apiKey)"
        
        //url
        if let url = URL(string: urlString)
        {
            //session
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: handler)
            
            task.resume()
        }
        
    }
    
    func handler(_ data: Data?,_ urlResponse: URLResponse?,_ error: Error?) -> Void {
        if error != nil {
            print(error!)
            return;
        }
        
        if let safeData = data {
            
            if let btcData = parseJSON(with: safeData) {
                delegate?.didUserPickNewCurrency(with: btcData)
                print(btcData)
            }
            else{
                print("Value is nil...")
            }
        }
    }
    
    
    
    func parseJSON(with data : Data) -> String? {
        let decoder = JSONDecoder();
        do {
            let data = try decoder.decode(DataDecodable.self, from: data)
            
            return String(format: "%.2f", data.rate!)
        }
        catch {
            print(error)
        }
        return nil
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //func getCoinPrice(for currency: String) {
    //
    //    // Tworze string
    //    let urlString = "\(baseURL)/\(currency)/?apikey=\(apiKey)"
    //
    //    // Tworze safe URL
    //    if let url = URL(string: urlString) {
    //
    //        // tworze sesje
    //        let session = URLSession(configuration: .default)
    //
    //        //Tworze task
    //        let task = session.dataTask(with: url) { (data, response, error ) in
    //
    //            if error != nil {
    //                print(error!)
    //            }
    //
    //            if let safeData = data {
    //
    //                parseJSON(with: safeData)
    //            }
    //
    //        }
    //        task.resume()
    //    }
    //}
    //
    //func parseJSON(with data : Data) {
    //
    //    let decoder = JSONDecoder()
    //    do {
    //        let decodedData = try decoder.decode(CoinData.self, from: data)
    //        let lastPrice = decodedData.rate
    //        print(lastPrice)
    //    }
    //     catch {
    //        print(error)
    //    }
    //
    //}
    //}
}
