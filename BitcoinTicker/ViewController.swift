//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Angela Yu on 23/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//
//    }
    //means our UIViewController has to confirm to the UIPickerViewDelegare and UIPickerView Data Source
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let currencySymbolArray = ["$", "R$", "$", "Â¥", "â‚¬", "Â£", "$", "Rp", "â‚ª", "â‚¹", "Â¥", "$", "kr", "$", "zÅ‚", "lei", "â‚½", "kr", "$", "$", "R"]
    var finalURL = ""
    var currencySelected = ""

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    //this function is needed to ensure that our two delegates above conforms with its default mandate protocols/interface
    //this is where you specify how many components we have in our UIView
    //in our case, we only want one component because our pickerView only has one data which is always the currency.
    //if it was the date picker view object, our required component could have been 4 (date, hour, minutes and PM OR AM)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //single component or single column UI View
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        currencyArray.count //returns the number of currency we have
        }
    
    //loops throught the component item and displays the currency title based on the currency array's index starting from 0 by default
    //NOTE : This delegate mathod will going to be called by the UIPicker upon loading up.. and its going to look here to fetch the titles to be displayed on the UIPicker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    //this delegate method gets called when a user selects any row which could be any currency he desires
    
//    this didselectRow pickerview delegate gets called when a user selects a row in a component
    
    //To summarize it, this function simply prints out the currency the user has selected using the row technique
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) { //this methods finaly returns a row
//        print(currencyArray[row] )
        //we need to form our endpoint using the base url and any kind of currency the user wishes to fetch its bit coin price
        finalURL = baseURL + currencyArray[row]
        //making currency symbol dynamic based on the selected currency and mapping the currency symbol array index to it
        currencySelected = currencySymbolArray[row]
        getBitcoinData(url: finalURL)
        print(finalURL)
        
    }
     

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
       
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    
    
    

    
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    func getBitcoinData(url: String) {
        
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {

                    print("Sucess! Got the Bitcoin data!")
                    let bitcointJSON : JSON = JSON(response.result.value!)

                    self.updateBitcoinData(json: bitcointJSON)

                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.bitcoinPriceLabel.text = "Connection Issues!"
                }
            }

    }

    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
    
    func updateBitcoinData(json : JSON) {
        
        //use of optional binding so that we could bind the result of the json to the bitcoinResult variable
        //Note : the optional binding helps to check is the json["ask"] value is not nil before asinging the value to the bitcoinResult variable and execute the code in the if block
        if let bitcoinResult = json["ask"].double {
//            update the UI on the fetched result from the bitcoin API
            //this shows the user the bitcoin price
            bitcoinPriceLabel.text = currencySelected + String(bitcoinResult)
        }else{
            bitcoinPriceLabel.text = "Price Unavailable!"
        }
    }
    
}

