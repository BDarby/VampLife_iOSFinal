//
//  MapCard.swift
//  VampLife_iOSFinal
//
//  Created by Brittany Darby on 3/7/18.
//  Copyright © 2018 Brittany Darby. All rights reserved.
//

import UIKit


class MapCard: UIView {
    
    
    @IBOutlet var clubName: UILabel!
    @IBOutlet var clubImage: UIImageView!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var hoursLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    
    @IBAction func favButton(_ sender: Any) {
        
        
        
    }
    
    var view : UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        

        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        print("================================")
        
//        view.frame = self.bounds
//        view.headerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.headerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //loadNib()
    
    }
    
    
    func loadNib(){
//        view = commonInit()
//        addSubview(view)
    }
    
//     func commonInit() -> UIView{
//       Bundle.main.loadNibNamed("MapCard", owner: self, options: nil)
//        let bundle = Bundle.init(for: type(of: self))
//        let nib = UINib(nibName: "MapCard", bundle: bundle)
//        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
//        addSubview(view)
//        return view
//    }
    
    

}
