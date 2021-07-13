//
//  ViewController.swift
//  Loteria
//
//  Created by Mac on 07/07/2021.
//  Copyright © 2021 br.com.arthursilva. All rights reserved.
//

import UIKit

enum GameType: String{
    case megasena = "Mega-Sena"
    case quina = "Quina"
}
infix operator >-<
func >-< (total: Int, universe: Int) -> [Int]{
    var result: [Int] = []
    while result.count < total {
        let randomNumber = Int(arc4random_uniform(UInt32(universe))+1)
        if !result.contains(randomNumber){
            result.append(randomNumber)
        }
    }
    return result
    
}
class ViewController: UIViewController {
    @IBOutlet weak var ScGameType: UISegmentedControl!
    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet var balls: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumbers(for: .megasena)
    }
    
    func showNumbers (for type: GameType){
         lbGameType.text = type.rawValue
        var game: [Int] = []
        switch type {
            case .megasena:
                game += 6>-<60
                balls.last!.isHidden = false
            case .quina:
                game += 5>-<80
                balls.last!.isHidden = true
            }
        for (index, game) in game.enumerated(){
            balls[index].setTitle("\(game)", for: .normal)
        }
    }
    
    @IBAction func GenerateGame() {
        switch ScGameType.selectedSegmentIndex {
        case 0:
            showNumbers(for: .megasena)
        default:
            showNumbers(for: .quina)
        }
    }
}

