//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Angela Yu on 23/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//
//    }
    //means our UIViewController has to confirm to the UIPickerViewDelegare and UIPickerView Data Source
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var finalURL = ""

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
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currencyArray[row]
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
       
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    
    
    

    
    
    
//    
//    //MARK: - Networking
//    /***************************************************************/
//    
//    func getWeatherData(url: String, parameters: [String : String]) {
//        
//        Alamofire.request(url, method: .get, parameters: parameters)
//            .responseJSON { response in
//                if response.result.isSuccess {
//
//                    print("Sucess! Got the weather data")
//                    let weatherJSON : JSON = JSON(response.result.value!)
//
//                    self.updateWeatherData(json: weatherJSON)
//
//                } else {
//                    print("Error: \(String(describing: response.result.error))")
//                    self.bitcoinPriceLabel.text = "Connection Issues"
//                }
//            }
//
//    }
//
//    
//    
//    
//    
//    //MARK: - JSON Parsing
//    /***************************************************************/
//    
//    func updateWeatherData(json : JSON) {
//        
//        if let tempResult = json["main"]["temp"].double {
//        
//        weatherData.temperature = Int(round(tempResult!) - 273.15)
//        weatherData.city = json["name"].stringValue
//        weatherData.condition = json["weather"][0]["id"].intValue
//        weatherData.weatherIconName =    weatherData.updateWeatherIcon(condition: weatherData.condition)
//        }
//        
//        updateUIWithWeatherData()
//    }
//    




}

