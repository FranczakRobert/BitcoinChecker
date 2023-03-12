//
//  ViewController.swift
//  BitcoinPrice
//
//  Created by Robert Franczak on 28/02/2023.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
     
    var coinManager = CoinManager()
    
    @IBOutlet weak var currencyLabel:  UILabel!
    @IBOutlet weak var bitcoinLabel:   UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate   = self
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currencyLabel.text = coinManager.currencyArray[row]
        let currencyPicekd = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: currencyPicekd)
    }
}

extension ViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count;
    }
}

extension ViewController : CoinManagerDelegate {
    
    func didUserPickNewCurrency(with data: String) {
        print("??")
        DispatchQueue.main.async() {
            print("!!!")
            print(data)
            print("!!!")
            self.bitcoinLabel.text = data
        }
    }
}

