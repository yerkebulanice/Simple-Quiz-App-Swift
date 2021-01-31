//
//  ViewController.swift
//  QuizApp
//
//  Created by Еркебулан on 28.01.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func historyButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "HistoryViewController") as! HistoryViewController
                navigationController?.pushViewController(vc, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Quiz app"
    }
    
    @IBAction func startButtom(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
                navigationController?.pushViewController(vc, animated: true)
    }


}

