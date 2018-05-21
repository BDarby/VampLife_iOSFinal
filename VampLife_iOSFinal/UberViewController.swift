//
//  UberViewController.swift
//  VampLife_iOSFinal
//
//  Created by Brittany Darby on 2/20/18.
//  Copyright © 2018 Brittany Darby. All rights reserved.
//

import UIKit
import UberRides
import CoreLocation

class UberViewController: UIViewController {
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let button = RideRequestButton()
//        // set a dropoffLocation
//        let dropoffLocation = CLLocation(latitude: 37.6213129, longitude: -122.3789554)
//        let builder = RideParametersBuilder()
//        builder.dropoffLocation = dropoffLocation
//        builder.dropoffNickname = "Awesome Airport"
//        button.rideParameters = builder.build()
        
        
        
        // center button
//        button.center = view.center
//        
//        //put the button in the view
//        view.addSubview(button)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getRide(_ sender: Any) {
        let builder = RideParametersBuilder()
        let rideParameters = builder.build()
        let deeplink = RequestDeeplink(rideParameters: rideParameters, fallbackType: .mobileWeb)
        deeplink.execute()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
