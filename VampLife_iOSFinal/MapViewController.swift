//
//  MapViewController.swift
//  VampLife_iOSFinal
//
//  Created by Brittany Darby on 2/21/18.
//  Copyright © 2018 Brittany Darby. All rights reserved.
//


// ************** THIS IS ON GITHUB *****************

//Don't forget to add comments

import UIKit
import Firebase
import FirebaseDatabase
import GooglePlaces
import GoogleMaps
//import Mapbox

class MapViewController: UIViewController, GMSMapViewDelegate { //MGLMapViewDelegate {

    
    @IBOutlet var MapCard: UIView!
    @IBOutlet var mapView: GMSMapView!
    var clubObjArray:[ClubObjects] = []
    
    var tampaLat = 27.9473508
    var tampaLong = -82.4628223
    
    //var map_string = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=28.5393771,-81.3816546&radius=900000&type=night_club&key=AIzaSyAUukffqwB5tf4oS1puWq8HE1nOk4t_sGI"
    
    //    var twoCitiesLat : [Double] = []
    //    var twoCitiesLong : [Double] = []
    var request : [String] = ["https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=28.5393771,-81.3816546&radius=900000&type=night_club&key=AIzaSyAUukffqwB5tf4oS1puWq8HE1nOk4t_sGI","https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=27.9473508,-82.4628223&radius=900000&type=night_club&key=AIzaSyAUukffqwB5tf4oS1puWq8HE1nOk4t_sGI"]
    
    //    let map_str1 =
    //    let map_str2 =
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.camera = GMSCameraPosition.camera(withLatitude: 28.5393771, longitude: -81.3816546, zoom: 9)
        
        //        let cordinates = Generalize.get_cordinates(myStr: map_str1)
        //        let cor = cordinates.split(separator: ",")
        //        twoCitiesLat.append(Double(String(cor[0]))!)
        //        twoCitiesLong.append(Double(String(cor[1]))!)
        //let jsonString = URL(string:map_str1)!
        
        
        //        let cordinates1 = Generalize.get_cordinates(myStr: map_str2)
        //        let cor2 = cordinates1.split(separator: ",")
        //        twoCitiesLat.append(Double(String(cor2[0]))!)
        //        twoCitiesLong.append(Double(String(cor2[1]))!)
        //let jsonString2 = URL(string:map_str2)!
        
        //        let jsonPhoto = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=CmRaAAAASSPcQ-PRcadh8JxvrTixhGr7Ktlk0tH2suzvbrT2iwHQOZHYPVtDWKzh-cbeVzfoqzUH7kD--AJ2a5cyF3JyBhevxyiu-kO3wJ6wpeCJLzk7NzSAZmqG88oROFzh3VKSEhBTvkvYyFCJqEgvpfd4BI3IGhQ2kIlbnwN7xeA4ZiRXxeu_o2C7Rw&key=AIzaSyAUukffqwB5tf4oS1puWq8HE1nOk4t_sGI"
        
        //        request.append(map_str1)
        //        request.append(map_str2)
        
        get_data()
        
    } //end of VIEW DID LOAD
    
    func get_data(){
        for url in self.request{
            ServiceManager.sharedSessionManager.downloadClub(from: url) { (clubs : [ClubObjects]) in
                self.clubObjArray += clubs
                DispatchQueue.main.async {
                    self.displayToMap()
                }
            }
        }
    }
    
    func displayToMap(){
        DispatchQueue.main.async {
            for i in 0..<self.clubObjArray.count{
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: self.clubObjArray[i].lat, longitude: self.clubObjArray[i].long)
                marker.title = self.clubObjArray[i].name
                marker.tracksInfoWindowChanges = true
                marker.snippet = String(i)
                marker.map = self.mapView
                
            }
        }
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView?
    {
        let infoWindow = Bundle.main.loadNibNamed("MapCard", owner: self, options: nil)?.first as! MapCard
        let myindex = Int(marker.snippet!)!
        infoWindow.addressLabel.text = clubObjArray[myindex].address
        infoWindow.clubName.text = clubObjArray[myindex].name
        if(clubObjArray[myindex].time){
            infoWindow.hoursLabel.text = "True"
        }else{
            infoWindow.hoursLabel.text = "False"
        }
        infoWindow.ratingLabel.text = String(clubObjArray[myindex].ratings)
        infoWindow.clubImage.image = UIImage(named: clubObjArray[myindex].photoReference)
        return infoWindow
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



