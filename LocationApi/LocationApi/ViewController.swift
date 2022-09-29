//
//  ViewController.swift
//  LocationApi
//
//  Created by student on 9/28/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let url = NSURL(string: "https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyACAluu1GjZhrCqCThJcFGUncXzad2U-Tw") {
            
            if let data = NSData(contentsOf: url as URL){
                
                
                do {
                    let parsed = try JSONSerialization.jsonObject(with:data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                    
                    let newDict = parsed
                    
                    print(newDict["currently"]!["address"] as Any)
                    print(newDict["currently"]!["state"] as Any)
                    
                    
                    
                    self.currentAddress.text = "\(newDict["currently"]!["Address"]!!)"
                    self.currentState.text = "\(newDict["currently"]!["State"]!!)"
                    
                }
                
                catch let error as NSError {
                    print("A JSON parsithng error occurred, here are the details:\n \(error)")
                }
            }
        }
    }
    
    
    @IBOutlet weak var currentAddress: UILabel!
    
    @IBOutlet weak var currentState: UILabel!
    
}

