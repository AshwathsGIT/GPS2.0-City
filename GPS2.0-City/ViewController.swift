//
//  ViewController.swift
//  GPS1
//
//  Created by Ashwath Sridhar on 15/12/16.
//  Copyright © 2016 Ashwath. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import AVFoundation
import AudioToolbox

class ViewController: UIViewController , CLLocationManagerDelegate,AVSpeechSynthesizerDelegate{
    
    @IBOutlet weak var alti: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var alert: UILabel!
    //Map
    @IBOutlet weak var mapView: MKMapView!
    let manager = CLLocationManager()
    let speechSynthesizer = AVSpeechSynthesizer()

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01,0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region,animated:true)
        self.mapView.showsUserLocation = true
        let a = Double(location.speed)
        let b = round((a * 1.60934)*100)/100
        let c = String(b)
        let d = Double(location.altitude)
        let e = round(d * 100)/100
        let f = String(e)
        speed.text = "\(c) Km/Hr"
        alti.text = "\(f) feet"
        
        while b == 0 {
            alert.text = "In Halt"
            alert.textColor = UIColor.blue
            let speak = alert.text!.components(separatedBy: "\t")
            
            for pieceOfText in speak{
                
                let speechUtterance = AVSpeechUtterance(string: pieceOfText)
                let voices = AVSpeechSynthesisVoice(language: "en-EN")
                speechUtterance.voice = voices
                self.speechSynthesizer.speak(speechUtterance)
                
            }

        }
       
        
       if( b == 0)
        {
            alert.text = "In Halt"
            alert.textColor = UIColor.blue
            
        }
        
        if( b > 0 && b < 0.5)
        {
            alert.text = "In Halt"
            alert.textColor = UIColor.blue
            let speak = alert.text!.components(separatedBy: "\t")
            
            for pieceOfText in speak{
                
                let speechUtterance = AVSpeechUtterance(string: pieceOfText)
                let voices = AVSpeechSynthesisVoice(language: "en-EN")
                speechUtterance.voice = voices
                self.speechSynthesizer.speak(speechUtterance)
                
            }

            
        }
        //else if(b > 0.499 && b < 3)
        else if(b > 0.499 && b < 2)
        {
            alert.text = "Get Going"
            alert.textColor = UIColor.green
            let speak = alert.text!.components(separatedBy: "\t")
            
            for pieceOfText in speak{
                
                let speechUtterance = AVSpeechUtterance(string: pieceOfText)
                let voices = AVSpeechSynthesisVoice(language: "en-EN")
                speechUtterance.voice = voices
                self.speechSynthesizer.speak(speechUtterance)
                
            }
            }
        // else if(b > 2.99 && b < 12)
        else if( b > 1.99  && b < 8)
        {
            alert.text = "Get Going"
            alert.textColor = UIColor.green

                   }
        // else if(b > 11.99 && b < 14.5)
        else if(b > 7.99 && b < 9.5)
        {
            alert.text = "Go on!!"
            alert.textColor = UIColor.magenta
            let speak = alert.text!.components(separatedBy: "\t")
            
            for pieceOfText in speak{
                
                let speechUtterance = AVSpeechUtterance(string: pieceOfText)
                let voices = AVSpeechSynthesisVoice(language: "en-EN")
                speechUtterance.voice = voices
                self.speechSynthesizer.speak(speechUtterance)
                
            }

        }
           // else if(b > 14.499 && b < 28)
        else if(b > 9.49 && b < 15)
        {
            alert.text = "Go on!!"
            alert.textColor = UIColor.magenta
            
        }
            //else if(b > 27.99 && b < 30.5)
        else if(b > 14.99 && b < 16.5)
        {
            alert.text = "Slow down !!"
            alert.textColor = UIColor.orange
            let speak = alert.text!.components(separatedBy: "\t")
            
            for pieceOfText in speak{
                
                let speechUtterance = AVSpeechUtterance(string: pieceOfText)
                let voices = AVSpeechSynthesisVoice(language: "en-EN")
                speechUtterance.voice = voices
                self.speechSynthesizer.speak(speechUtterance)
                
            }
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
            //else if(b > 30.499 && b < 38)
            else if (b > 16.49 && b < 22)
        {
            alert.text = "Slow down !!"
            alert.textColor = UIColor.orange

            
        }
            //else if(b > 37.99 && b < 39)
        else if(b > 21.99 && b < 23.5)
        {
            alert.text = "Too fast..Slow Down !!"
            alert.textColor = UIColor.red
            let speak = alert.text!.components(separatedBy: "\t")
            
            for pieceOfText in speak{
                
                let speechUtterance = AVSpeechUtterance(string: pieceOfText)
                let voices = AVSpeechSynthesisVoice(language: "en-EN")
                speechUtterance.voice = voices
                self.speechSynthesizer.speak(speechUtterance)
                
            }
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)

        }
           // else if(b > 38.99 && b < 41.5)
        else if(b > 23.49 && b < 29)
        {
            alert.text = "Too fast..Slow Down !!"
            alert.textColor = UIColor.red
             AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
            //else if(b > 40.499 && b < 42.5)
        else if (b > 28.99 && b < 31.5)
        {
            alert.text = "Insane"
            alert.textColor = UIColor.red
            let speak = alert.text!.components(separatedBy: "\t")
            
            for pieceOfText in speak{
                
                let speechUtterance = AVSpeechUtterance(string: pieceOfText)
                let voices = AVSpeechSynthesisVoice(language: "en-EN")
                speechUtterance.voice = voices
                self.speechSynthesizer.speak(speechUtterance)}
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            
        }
        //else if(b > 42.499 && b < 48.5)
        else if (b > 31.49 && b < 35)
        {
            alert.text = "Insane"
            alert.textColor = UIColor.red
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
        //else if(b > 48.499 && b < 50)
        else if(b > 34.99 && b < 36.5)
        {
            alert.text = "Good Luck !!"
            alert.textColor = UIColor.black
            let speak = alert.text!.components(separatedBy: "\t")
            
            for pieceOfText in speak{
                
                let speechUtterance = AVSpeechUtterance(string: pieceOfText)
                let voices = AVSpeechSynthesisVoice(language: "en-EN")
                speechUtterance.voice = voices
                self.speechSynthesizer.speak(speechUtterance)}
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            
        }
        //else if(b > 49.99)
        else if(b > 36.49)
        {
            alert.text = "Good Luck !!"
            alert.textColor = UIColor.black
        }

        else
        {
            alert.text = "In Halt"
            alert.textColor = UIColor.blue
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

