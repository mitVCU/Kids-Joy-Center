//
//  BalloonViewController.swift
//  Kids Joy Center
//
//  Created by Mit Amin on 3/20/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit

class BalloonViewController: UIViewController {
    var difficulty : Int?
    var TIMER = Timer()
    var SECONDS:Int = 60
    let Time : UIStackView = UIStackView()
    var image1 = UIImageView(image: UIImage(named: "cartoon-number-0"))
    let image2 = UIImageView(image: UIImage(named: "mark"))
    var image3 = UIImageView(image: UIImage(named: "cartoon-number-0"))
    var image4 = UIImageView(image: UIImage(named: "cartoon-number-0"))
    
    @objc func CLOCK () {
        SECONDS = SECONDS - 1
        
        if (SECONDS / 60 == 0 && SECONDS / 10 > 0 && SECONDS % 10 > 0) {
            image1.image = UIImage(named: "cartoon-number-0")
            image3.image = UIImage(named: "cartoon-number-\(SECONDS / 10)")
            image4.image = UIImage(named: "cartoon-number-\(SECONDS % 10)")
        }
        else if (SECONDS / 10 == 0 && SECONDS % 10 > 0) {
            image3.image = UIImage(named: "cartoon-number-0")
            image4.image = UIImage(named: "cartoon-number-\(SECONDS % 10)")
        }
        else if (SECONDS / 60 == 0 && SECONDS / 10 == 0 && SECONDS % 10 == 0) {
            image1.image = UIImage(named: "cartoon-number-0")
            image3.image = UIImage(named: "cartoon-number-0")
            image4.image = UIImage(named: "cartoon-number-0")
            TIMER.invalidate()
        }
        else {
            image1.image = UIImage(named: "cartoon-number-\(SECONDS / 60)")
            image3.image = UIImage(named: "cartoon-number-\((SECONDS/10) - (SECONDS / 60)*6 )")
            image4.image = UIImage(named: "cartoon-number-\(SECONDS % 10)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        //defining difficulty
        if difficulty == 1 {
            SECONDS = 60
        }
        else if difficulty == 2 {
            SECONDS = 45
        }
        else if difficulty == 3 {
            SECONDS = 30
        }
        
        print ("how Hard: ", difficulty!)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "sky-background")!)
        let image = UIImageView(image: UIImage(named: "time"))
        image.sizeToFit()
//        image.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        image.heightAnchor.constraint(equalToConstant: 50).isActive = true
        image.frame = CGRect(x: 0, y: 721, width: 140, height: 47)
        image1.frame = CGRect(x: 148, y: 721, width: 34, height: 47)
        image2.frame = CGRect(x: 190, y: 721, width: 30, height: 47)
        image3.frame = CGRect(x: 218, y: 721, width: 34, height: 47)
        image4.frame = CGRect(x: 258, y: 721, width: 34, height: 47)
        view.addSubview(image)
        view.addSubview(image1)
        view.addSubview(image2)
        view.addSubview(image3)
        view.addSubview(image4)
        
        image1.image = UIImage(named: "cartoon-number-\(SECONDS / 60)")
        image3.image = UIImage(named: "cartoon-number-\((SECONDS/10) - (SECONDS / 60)*6 )")
        image4.image = UIImage(named: "cartoon-number-\(SECONDS % 10)")
        
        TIMER = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SortingViewController.CLOCK) , userInfo: nil, repeats: true)
        
        let myImageView = UIImageView(image: UIImage(named: "star"))
        myImageView.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        
        myImageView.isUserInteractionEnabled = true
        //Must be enabled for tap events
        
        view.addSubview(myImageView)
        //Add an image programmatically
        
        let myPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(myPanAction)) //Update: July 18, 2016 for Xcode 7.3.1(Swift 2.2)
        
        myPanGestureRecognizer.minimumNumberOfTouches = 1
        myPanGestureRecognizer.maximumNumberOfTouches = 1
        
        myImageView.addGestureRecognizer(myPanGestureRecognizer)

    }
    
    @objc func myPanAction(recognizer: UIPanGestureRecognizer) {
        if ((recognizer.state != UIGestureRecognizerState.ended) &&
            (recognizer.state != UIGestureRecognizerState.failed)) {
            recognizer.view?.center = recognizer.location(in: recognizer.view?.superview)
        }
    }
    
    func assignbackground(){
        let background = UIImage(named: "sky-background")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
}
