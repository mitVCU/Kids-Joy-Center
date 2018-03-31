//
//  SortingViewController.swift
//  Kids Joy Center
//
//  Created by Mit Amin on 3/20/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit

class SortingViewController: UIViewController {
    var difficulty : Int?
    var TIMER = Timer()
    var SECONDS:Int = 60
    let Time : UIStackView = UIStackView()
    var image1 = UIImageView(image: UIImage(named: "cartoon-number-0"))
    let image2 = UIImageView(image: UIImage(named: "mark"))
    var image3 = UIImageView(image: UIImage(named: "cartoon-number-0"))
    var image4 = UIImageView(image: UIImage(named: "cartoon-number-0"))
    let land1 = UIView(frame: CGRect(x: 491, y: 643, width: 533, height: 127))
    let land2 = UIView(frame: CGRect(x: 728, y: 504, width: 296, height: 139))
    let water1 = UIView(frame: CGRect(x: 0, y: 643, width: 491, height: 127))
    let water2 = UIView(frame: CGRect(x: 0, y: 505, width: 728, height: 140))
    let sky = UIView(frame: CGRect(x: 0, y: 160, width: 1024, height: 349))
    let toyBox = UIView(frame: CGRect(x: 0, y: 64, width: 1024, height: 96))



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
        toyBox.backgroundColor = .blue
        toyBox.alpha = 0.5
        self.view.addSubview(toyBox)
        self.view.addSubview(land1)
        self.view.addSubview(land2)
        self.view.addSubview(water1)
        self.view.addSubview(water2)
        self.view.addSubview(sky)

        
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
        assignbackground()
        let image = UIImageView(image: UIImage(named: "time"))
        image.sizeToFit()
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

        

        
        let toys = ["1-1", "1-2", "1-3", "1-4", "1-5", "2-1", "2-2", "2-3", "2-4", "2-5", "3-1", "3-2"]
//        let toyvox = UIStackView(arrangedSubviews: createToys(names: toys) )
//        toyvox.translatesAutoresizingMaskIntoConstraints = false
//        toyvox.axis = .horizontal
//        toyvox.distribution = .fillEqually
//        toyvox.alignment = .center
//        toyvox.spacing = 10.0
//        self.view.addSubview(toyvox)

//        toyvox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
//        toyvox.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 72).isActive = true
//        toyvox.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
//        toyvox.bottomAnchor.constraint(equalTo: self.view.topAnchor, constant: 158).isActive = true
//
        var x = 20
        for name in toys{
           let toy =  createToy(names: name, xPos: x)
            view.addSubview(toy)
            x = x + 82
        }
    }
    
    @objc func myPanAction(recognizer: UIPanGestureRecognizer) {
        if ((recognizer.state != UIGestureRecognizerState.ended) &&
            (recognizer.state != UIGestureRecognizerState.failed)) {
            recognizer.view?.center = recognizer.location(in: recognizer.view?.superview)
        }
        else if recognizer.state == UIGestureRecognizerState.ended{
            let d = (recognizer.view?.accessibilityIdentifier)!
            var Arr = d.components(separatedBy: ",")
            let id = Arr[1]
            let x = Int(Arr[0])
            var loc = id.components(separatedBy: "-")
            let y = (recognizer.view?.center.y)! + 37
            let curX = (recognizer.view?.center.x)!

            let type = Int(loc[0].replacingOccurrences(of: " ", with: ""))
            if type == 1 && y > 509 {
                UIView.animate(withDuration: 3.0){
                    self.moveBack(view: recognizer.view!)
                }
            }
            else if type == 2 && y < 509  {
                UIView.animate(withDuration: 3.0){
                    self.moveBack(view: recognizer.view!)
                }
            }
            else if type == 2  && y > 509 && curX > 728 {
                UIView.animate(withDuration: 3.0){
                    self.moveBack(view: recognizer.view!)
                }
            }
            else if type == 2  && y > 643 && curX > 491 {
                UIView.animate(withDuration: 3.0){
                    self.moveBack(view: recognizer.view!)
                }
            }
            else if type == 3 && y < 509  {
                UIView.animate(withDuration: 3.0){
                    self.moveBack(view: recognizer.view!)
                }
            }
            else if type == 3  && y > 509 && curX < 728 {
                UIView.animate(withDuration: 3.0){
                    self.moveBack(view: recognizer.view!)
                }
            }
            else if type == 3  && y > 643 && curX < 491 {
                UIView.animate(withDuration: 3.0){
                    self.moveBack(view: recognizer.view!)
                }
            }

            
           
            
        }
    }
    
    func  moveBack(view: UIView){
        let d = (view.accessibilityIdentifier)!
        var Arr = d.components(separatedBy: ",")
        let id = Arr[1]
        let x = Int(Arr[0])
        print(id, x)
        view.center = CGPoint(x: x!+37, y: 74+37)
    }
    
//    func createToys (names: [String]) -> [UIImageView]{
//        return names.map({name in
//            let myImageView = UIImageView(image: UIImage(named: name))
//            myImageView.translatesAutoresizingMaskIntoConstraints = false
//            myImageView.isUserInteractionEnabled = true
//            let move = UIPanGestureRecognizer(target: self, action: #selector(myPanAction))
//            move.minimumNumberOfTouches = 1
//            move.maximumNumberOfTouches = 1
//            myImageView.addGestureRecognizer(move)
//            return myImageView
//        })
//    }
    
    func createToy (names: String, xPos:Int) -> UIImageView{
        let myImageView = UIImageView(image: UIImage(named: names))
        myImageView.frame = CGRect(x: xPos, y: 74, width: 75, height: 75)
        myImageView.isUserInteractionEnabled = true
        myImageView.accessibilityIdentifier = "\(xPos), \(names)"
        let move = UIPanGestureRecognizer(target: self, action: #selector(myPanAction))
        myImageView.addGestureRecognizer(move)
        return myImageView
    }

    
    
    func assignbackground(){
        let background = UIImage(named: "air-land-water")
        var imageView : UIImageView!
        let width = UIScreen.main.bounds.size.width
        imageView = UIImageView(frame: CGRect(x: 0, y: 160, width: width, height: 608))
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
}
