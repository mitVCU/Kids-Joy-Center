//
//  ViewController.swift
//  Kids Joy Center
//
//  Created by Mit Amin on 3/19/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var memGame: UIButton!
    @IBOutlet weak var sortingGame: UIButton!
    @IBOutlet weak var balloonGame: UIButton!
    @IBOutlet weak var easyBtn: UIButton!
    @IBOutlet weak var mediumBtn: UIButton!
    @IBOutlet weak var hardBtn: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    
    var isMem = false
    var isSort = false
    var isBallon = false
    var isEasy = false
    var isMedium = false
    var isHard = false

    var isGame = [Bool]()
    var isDif = [Bool]()
    var selectedDif : Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        background.alpha = 0.5
        isGame.append(isMem)
        isGame.append(isSort)
        isGame.append(isBallon)
        isDif.append(isEasy)
        isDif.append(isMedium)
        isDif.append(isHard)
    }

    @IBAction func onClickMem(_ sender: Any) {
        isSelectedGame(game: memGame, isPicked: &isMem, position: 0)
    }
    @IBAction func onClickSort(_ sender: Any) {
        isSelectedGame(game: sortingGame, isPicked: &isSort, position: 1)
    }
    @IBAction func onClickBalloon(_ sender: Any) {
        isSelectedGame(game: balloonGame, isPicked: &isBallon, position: 2)
    }
    @IBAction func onClickEasy(_ sender: Any) {
        isSelectedDif(dif: easyBtn, isPicked: &isEasy, position: 0)
    }
    @IBAction func onClickMed(_ sender: Any) {
        isSelectedDif(dif: mediumBtn, isPicked: &isMedium, position: 1)
    }
    @IBAction func onClickHard(_ sender: Any) {
        isSelectedDif(dif: hardBtn, isPicked: &isHard, position: 2)
    }
    @IBAction func onClickHighScores(_ sender: Any) {
    }
    
    
    @IBAction func onClickPlay(_ sender: Any) {
        if isGame[0]==true && isDif.contains(true){
            performSegue(withIdentifier: "toMem", sender: sender)
        }
        else if isGame[1]==true && isDif.contains(true){
            performSegue(withIdentifier: "toSort", sender: sender)
        }
        else if isGame[2]==true && isDif.contains(true) {
            performSegue(withIdentifier: "toBalloon", sender: sender)
        }
        else{
            createAlert(title: "No Game", message: "You did not Select a game or a difficulty level")
        }
    }
    
    

    func createAlert (title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Warning", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }

    func isSelectedGame ( game: UIButton,  isPicked:inout Bool, position:Int){
        if isGame.index(where: { $0 == true }) == nil{
            isGame[position] = true
            game.alpha = 0.5
        }
        else{
            game.alpha = 1
            isGame[position] = false
        }
    }
    
    func isSelectedDif ( dif: UIButton,  isPicked:inout Bool, position:Int){
        if isDif.index(where: { $0 == true }) == nil{
            isDif[position] = true
            dif.alpha = 0.5
            selectedDif = position + 1
            
        }
        else{
            dif.alpha = 1
            isDif[position] = false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MemoryViewController{
            destination.difficulty = selectedDif
        }
        else if let destination = segue.destination as? SortingViewController{
            destination.difficulty = selectedDif
        }
        else if let destination = segue.destination as? BalloonViewController{
            destination.difficulty = selectedDif
        }
    }
}

