//
//  FavoriteTableViewCell.swift
//  VampLife_iOSFinal
//
//  Created by Brittany Darby on 3/7/18.
//  Copyright © 2018 Brittany Darby. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet var favImage: UIImageView!
    
    @IBOutlet var favName: UILabel!
    
    @IBOutlet var favAddress: UILabel!
    
    
//    @IBAction func unwind(for: "favSegue", towardsViewController: Favorites){
//        
//    }
    
    
    @IBAction func backwards(_segue: UIStoryboardSegue){
       
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
