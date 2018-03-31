//
//  MemoryViewController.swift
//  Kids Joy Center
//
//  Created by Mit Amin on 3/19/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit
class arra {
    static var imgs = [1,2,3,4,5,6,1,2,3,4,5,6]
}

class MemoryViewController: UIViewController {
    var difficulty : Int?
    var TIMER = Timer()
    var SECONDS:Int = 60
    let t = UIImage(named: "time")
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
        print (makeList(n: 15))
        print(difficulty!,"how hard")
        var dif : Array<String> = []

        //defining difficulty
        if difficulty == 1 {
            dif = ["1", "2", "3"]
            arra.imgs = [1,2,3,4,5,6,1,2,3,4,5,6]
        }
        else if difficulty == 2 {
            dif = ["1", "2", "3", "4"]
            arra.imgs = [1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8]
        }
        else if difficulty == 3 {
            dif = ["1", "2", "3", "4", "5"]
            arra.imgs = [1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10]
        }

        let image = UIImageView(image: UIImage(named: "time"))
        image.sizeToFit()
   //     image.widthAnchor.constraint(equalToConstant: 150).isActive = true
 //       image.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
        
        // creating the mystery blocks
        assignbackground()
        let stackView = createStackView(quant: dif)
        self.view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    


    private func createStackView(quant: [String])-> UIStackView {
        let retStackView = UIStackView()
        retStackView.axis = .vertical
        retStackView.distribution = UIStackViewDistribution.equalSpacing
        retStackView.alignment = .center
        retStackView.spacing = 20.0
        retStackView.translatesAutoresizingMaskIntoConstraints = false

        var i = 1
        while (i <= 4) {
            let stackView = UIStackView(arrangedSubviews: createButtons(named: quant))
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.spacing = 20
            stackView.distribution = .fillEqually
            retStackView.addArrangedSubview(stackView)
            i = i+1
        }

        return retStackView
    }

    private func createButtons(named: [String]) -> [UIButton] {
        let image = UIImage(named: "question") as UIImage?
        var returnArr = [UIButton]()

        for name in named{
            let randomIndex = Int(arc4random_uniform(UInt32(arra.imgs.count)))
            let button = UIButton()
            button.setTitle(name, for: .normal)
            button.setImage(image, for: .normal)
            button.setBackgroundImage(UIImage(named: "\(arra.imgs[randomIndex])"), for: .normal)
            arra.imgs.remove(at: randomIndex)
            button.sizeToFit()
            button.widthAnchor.constraint(equalToConstant: 100).isActive = true
            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(action), for: UIControlEvents.touchUpInside)
            returnArr.append(button)
        }
        return returnArr
    }

    @objc func action(sender:UIButton!) {
        sender.setImage(nil, for: .normal)
    }
    
    func makeList(n:Int ) -> [Int] {
        var result:[Int] = []
        for _ in 0..<n {
            result.append(Int(arc4random_uniform(20) + 1))
        }
        return result.sorted()
    }
    
    func assignbackground(){
        let background = UIImage(named: "background")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
} // end of MemoryViewController class
