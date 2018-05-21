//
//  MapTableViewController.swift
//  VampLife_iOSFinal
//
//  Created by Brittany Darby on 3/24/18.
//  Copyright © 2018 Brittany Darby. All rights reserved.
//



import UIKit
import GooglePlaces
import GoogleMaps
import Mapbox

class MapTableViewController: UITableViewController {
    
    
    @IBOutlet var mNameLabel: UILabel!
    
    @IBOutlet var mTimeLabel: UILabel!
    
    @IBOutlet var mRatingLabel: UILabel!
    
    @IBOutlet var mAddressLabel: UILabel!
    
    
    
    var clubObjArray:[ClubObjects] = []
    var sendText = ""
    var favSelected = false
    var sendMoreText = ""
    let jsonStringArray = [""]
    
    
      let jsonString = URL(string:"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=28.5393771,-81.3816546&radius=900000&type=night_club&key=AIzaSyAUukffqwB5tf4oS1puWq8HE1nOk4t_sGI")!
    
    let jsonStringTwo = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=27.9473508,-82.4628223&radius=900000&type=night_club&key=AIzaSyAUukffqwB5tf4oS1puWq8HE1nOk4t_sGI")!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let config = URLSession.shared
        
        let request = URLRequest(url: jsonString)
        let request2 = URLRequest(url:jsonStringTwo)
        
        
        let googleTask = config.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

            guard error == nil else{
                return
            }

            guard let data = data else{
                return
            }
            do{

                if let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]{

                    if let resultsArray = jsonObj["results"] as? [Any] {

                        for apiResults in resultsArray{
                            let valueCast = apiResults as? [String:Any]
                            if let apiResultsOutPut = valueCast {
                                let clubsObj = ClubObjects()
                                if let apiOpenHours = apiResultsOutPut["opening_hours"] as? [String:Any]{
                                    if let apiOpenNow = apiOpenHours["open_now"] as? Bool {
                                        clubsObj.time = apiOpenNow

                                    }
                                }
                                if let apiPhoto =  apiResultsOutPut["photos"] as? [[String:Any]]{
                                    for photo in apiPhoto {
                                        if let apiPhotoRef = photo["photo_reference"] as? String{
                                            clubsObj.photoReference = apiPhotoRef
                                        }
                                    }
                                }

                                if let apiRating = apiResultsOutPut["rating"] as? Double{
                                    clubsObj.ratings = apiRating
                                }

                                if let apiVicinity = apiResultsOutPut["vicinity"] as? String{
                                    clubsObj.address = apiVicinity
                                }


                                if let apiName = apiResultsOutPut["name"] as? String {
                                    clubsObj.name = apiName
                                }
                                if let apiGeometry = apiResultsOutPut["geometry"] as? [String: Any]{
                                    //print(apiGeometry)
                                    if let apiLocation = apiGeometry["location"] as? [String:Double]{
                                        if let apiLat = apiLocation["lat"] {
                                            clubsObj.lat = apiLat
                                        }
                                        if let apiLng = apiLocation["lng"] {
                                            clubsObj.long = apiLng
                                        }
                                    }

                                }
                                self.clubObjArray.append(clubsObj)
                                print(self.clubObjArray)
                            }

                        }

                    }
                }
            } catch let error {
                print(error.localizedDescription)
            }

        })
        googleTask.resume()

        
        
        let googleTask2 = config.dataTask(with: request2 as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else{
                return
            }
            
            guard let data = data else{
                return
            }
            do{
                
                if let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]{
                    
                    if let resultsArray = jsonObj["results"] as? [Any] {
                        
                        for apiResults in resultsArray{
                            let valueCast = apiResults as? [String:Any]
                            if let apiResultsOutPut = valueCast {
                                let clubsObj = ClubObjects()
                                if let apiOpenHours = apiResultsOutPut["opening_hours"] as? [String:Any]{
                                    if let apiOpenNow = apiOpenHours["open_now"] as? Bool {
                                        clubsObj.time = apiOpenNow
                                        
                                    }
                                }
                                if let apiPhoto =  apiResultsOutPut["photos"] as? [[String:Any]]{
                                    for photo in apiPhoto {
                                        if let apiPhotoRef = photo["photo_reference"] as? String{
                                            clubsObj.photoReference = apiPhotoRef
                                        }
                                    }
                                }
                                
                                if let apiRating = apiResultsOutPut["rating"] as? Double{
                                    clubsObj.ratings = apiRating
                                }
                                
                                if let apiVicinity = apiResultsOutPut["vicinity"] as? String{
                                    clubsObj.address = apiVicinity
                                }
                                
                                
                                if let apiName = apiResultsOutPut["name"] as? String {
                                    clubsObj.name = apiName
                                }
                                if let apiGeometry = apiResultsOutPut["geometry"] as? [String: Any]{
                                    //print(apiGeometry)
                                    if let apiLocation = apiGeometry["location"] as? [String:Double]{
                                        if let apiLat = apiLocation["lat"] {
                                            clubsObj.lat = apiLat
                                        }
                                        if let apiLng = apiLocation["lng"] {
                                            clubsObj.long = apiLng
                                        }
                                    }
                                    
                                }
                                self.clubObjArray.append(clubsObj)
                                print(self.clubObjArray)
                            }
                            
                        }
                        
                    }
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        })
        googleTask2.resume()
        
        
    
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    } //end of view did load
    
    
    
    @IBAction func favoriteButton(_ sender: UIButton) {
       
        print("================================")
        
        performSegue(withIdentifier: "back", sender: nil)
        
            if let mainsite = UserDefaults.standard.string(forKey:"sendMoreText"), !mainsite.isEmpty {
                UserDefaults.standard.set(false, forKey: "sendMoreText");
                UserDefaults.standard.synchronize()
                
                
               // MapTableViewCell.mName.text = FavoritesTableViewCell.favImage.text
                
                
                sender.setTitle(title, for: UIControlState.normal)
                
            }
                
               
            else{
                UserDefaults.standard.set(true, forKey: "sendMoreText");
                UserDefaults.standard.synchronize();
                
                
            }
        
        
        
       
       
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "back"{
              let fvc = segue.destination as? FavoriteTableViewCell
                fvc?.favName.text = mNameLabel.text
                
                print(mNameLabel.text)
            }
       }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return 1
        return clubObjArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MapTableViewCell else {
            return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        }
        let currentClub = clubObjArray[indexPath.row]
        cell.mName.text = currentClub.name
        cell.mRatings.text = String(currentClub.ratings)
        cell.mAddress.text = currentClub.address
        cell.mHours.text = String(currentClub.time)
        
        cell.tapFavBtn = { (cell) in
            Generalize.clubObj = currentClub
            self.tabBarController?.selectedIndex = 2
        }
        
        return cell
    }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    
    performSegue(withIdentifier: "segue", sender: self)
   }
    

    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow{
            let snds = clubObjArray[indexPath.row]
            if let destination = segue.destination as? DetailsViewController{
                destination.getName = snds.name
                destination.getAddress = snds.address
            }
        }
    }
 

}
