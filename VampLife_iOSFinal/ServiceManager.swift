//
//  ServiceManager.swift
//  VampLife_iOSFinal
//
//  Created by Brittany Darby on 5/20/18.
//  Copyright © 2018 Brittany Darby. All rights reserved.
//

import UIKit

class ServiceManager: NSObject {

    static var sharedSessionManager = ServiceManager()
    
    func executeGetRequest(with urlString: String, completion: @escaping (Data?) -> ()) {
        
        let url = URL.init(string: urlString)
        let urlRequest = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                print(error.debugDescription)
            } else {
                completion(data)
            }
            }.resume()
    }
    
    func downloadClub(from urlString: String, completion: @escaping ([ClubObjects]) -> ()) {
        executeGetRequest(with: urlString) { (data) in
            do {
                let responseDict = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                if let results = responseDict!["results"] as? [[String:Any]] {
                    var club = [ClubObjects]()
                    for apiResultsOutPut in results {
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
                            if let apiLocation = apiGeometry["location"] as? [String:Double]{
                                if let apiLat = apiLocation["lat"] {
                                    clubsObj.lat = apiLat
                                }
                                if let apiLng = apiLocation["lng"] {
                                    clubsObj.long = apiLng
                                }
                            }
                        }
                        
                        club.append(clubsObj)
                    }
                    completion(club)
                }
            } catch {
                print("ERROR: could not retrieve response")
            }
        }
    }
    
    
}
