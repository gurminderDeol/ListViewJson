//
//  InterfaceController.swift
//  MemorizingApp WatchKit Extension
//
//  Created by Kiran Mehal on 2019-03-14.
//  Copyright © 2019 Kiran Mehal. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var NameLabel: WKInterfaceLabel!
    
    
    @IBOutlet weak var image1: WKInterfaceImage!
    
    @IBOutlet weak var imageTwo: WKInterfaceImage!
    
    @IBOutlet weak var imageThree: WKInterfaceImage!
    
    @IBOutlet weak var imagefour: WKInterfaceImage!
    
    
    @IBOutlet weak var resultedNameLabel: WKInterfaceLabel!
    
    @IBAction func nameButtonClicked() {
        
        let suggestedResponses = [""]
        presentTextInputController(withSuggestions: suggestedResponses, allowedInputMode: .plain) {
            
            (results) in
            
            
            if (results != nil && results!.count > 0) {
                // 2. write your code to process the person's response
                
                let userResponse = results?.first as? String
                self.NameLabel.setText(userResponse)

            }
        }

    }
    
    var imageOne:UIImage!
    var image2:UIImage!
    var image3:UIImage!
    var image4:UIImage!
    
    var images:[UIImage]!
    
    var animatedImage:UIImage!
    
    
    var isWatching = true {
        didSet {
            if isWatching {
                setTitle("WATCH!")
            } else {
                setTitle("REPEAT!")
            }
        }
    }
    
    @IBAction func startGameButtonClicked() {
        // save the name to shared preferences
        let sharedPreferences = UserDefaults.standard
        sharedPreferences.set(self.NameLabel, forKey:"name")
        //print("Saved \(self.NameLabel) to shared preferences!")
        
     //self.willActivate()
        
    }
   
    
    

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
       // let images = [imageOne,image2,image3,image4]
        
/*        image1.setImage(UIImage(named: "imag4"))
        imageTwo.setImage(UIImage(named: "image3"))
        imageThree.setImage(UIImage(named: "image1"))
        imagefour.setImage((UIImage(named: "image2")))*/
        
      /* imageOne = UIImage(named:"bmw")
        image2 = UIImage(named:"insta")
        image3 = UIImage(named:"apple")
        image4 = UIImage(named:"plogo")*/
        
       // images = [image1,image2,image3,image4]
      //  animatedImage = UIImage.animatedImage(with: images as! [UIImage], duration: 2.0)
       // image1.setImage(animatedImage)
        //image1.startAnimating()
        
        // 0. Check if there is a previously saved name
        let sharedPreferences = UserDefaults.standard
        var name = sharedPreferences.string(forKey: "name")
        
        if (name == nil) {
            // by default, the strating city is Vancouver
            name = "kiran"
            print("No name was set, setting default name to blank")
        }
        else {
            print("I found a city: \(String(describing: name))")
        }
        
        // update the label to show the current city
        //self.resultedNameLabel.setText(name)
        

        
        
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
