//
//  DetailsViewController.swift
//  VampLife_iOSFinal
//
//  Created by Brittany Darby on 3/31/18.
//  Copyright © 2018 Brittany Darby. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet var detailName: UILabel!
    
    @IBOutlet var detailAddress: UILabel!
    
    var getName : String?
    var getAddress : String?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        detailName.text = getName
        detailAddress.text = getAddress

        // Do any additional setup after loading the view.
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
