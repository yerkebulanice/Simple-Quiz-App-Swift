//
//  ResultsViewController.swift
//  QuizApp
//
//  Created by Еркебулан on 31.01.2021.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    
    @IBAction func tryAgainButton(_ sender: Any) {
    }
    var mistake = 0
    var total = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var percentDouble = Double(mistake) / Double(total)
        percentDouble *= 100
        let percent = Int(percentDouble)
        percentLabel.text = "\(percent)%"
   
        var title = ""
        if(percentDouble < 50) {
            title = "Very bad"
        } else if(percentDouble < 70) {
            title = "Poidet"
        } else {
            title = "Excellent"
        }
        feedbackLabel.text = title
    }
    
}
