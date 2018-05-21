//
//  MapTableViewCell.swift
//  VampLife_iOSFinal
//
//  Created by Brittany Darby on 3/24/18.
//  Copyright © 2018 Brittany Darby. All rights reserved.
//

import UIKit

class MapTableViewCell: UITableViewCell {
    
    var mapTV = MapViewController()
    
    var favSelected = false

    @IBOutlet var mName: UILabel!
    
    @IBOutlet var mRatings: UILabel!
    
    @IBOutlet var mAddress: UILabel!
    
    @IBOutlet var mHours: UILabel!
    
    var tapFavBtn : ((UITableViewCell) -> Void)?
    
    @IBAction func favButton(_ sender: Any) {
        tapFavBtn?(self)
        //let buttonTag = (sender as AnyObject).tag
        
        //var indexPath : IndexPath = Favorites.indexPathForRow(at: )
        
        
        //favSelected = !favSelected
        
        
        
//        if favSelected == true {
//            //this is where I send the selected cell over to the FavoritesTableView Cell
//          //  mName.text =
//
//
//        } else {
//            //This is where I deselect the button and it's no longer on the tableview
//        }
    }
    
    
    
    
    
    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        let favBut = UIButton(type: .system)
//        favBut.setImage(#imageLiteral(resourceName: "fav"), for: .normal)
//        favBut.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        favBut.tintColor = .purple
//
//        favBut.addTarget(self, action: #selector(testPunch), for: .touchUpInside)
//        accessoryView = favBut
//
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    @objc private func testPunch(){
//        print("the button is favoriting==================================================")
//    }



    
    
    
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
