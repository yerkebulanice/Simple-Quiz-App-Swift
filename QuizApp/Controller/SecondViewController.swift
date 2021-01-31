//
//  SecondViewController.swift
//  QuizApp
//
//  Created by Еркебулан on 28.01.2021.
//

import UIKit

class SecondViewController: UIViewController {
    var questions = [
        Question(
            question: "Who was the THIRD man to walk on the moon?",answers: ["Neil Armstrong", "Mark Hamill", "Charles Conrad", "Astronaut Audrey"],correctAnswer: 2),
        Question(
            question: "Which war started in 1939 and ended in 1945?",answers: ["World War I", "The Vietnam War", "World War II", "The Falklands War"],correctAnswer: 2),
        Question(
            question: "What is the biggest ocean in the world?",answers: ["Atlantic Ocean", "Indian Ocean", "Arctic Ocean", "Pacific Ocean"],correctAnswer: 3),
        Question(
            question: "Who was President of South Africa from 1994 to 1999?",answers: ["Nelson Mandela","Kgalema Motlanthe","Jacob Zuma","Cyril Ramaphosa"],correctAnswer: 0),
        Question(question: "Which of the following nations does NOT share part of its border with Kazakhstan?", answers: ["Russia","Turkmenistan","China","Afghanistan"], correctAnswer: 3),
        Question(question: "Kazakhstan's citizens celebrate their independence from the former Soviet Union on what day?", answers: ["January 23rd","November 21st","March 19th","December 16th"], correctAnswer: 3),
        Question(question: "The state language of Kazakhstan is Kazakh. What is the nation's other official language?", answers: ["English","Chinese","Russian","Turkish"], correctAnswer: 2),
        Question(question: "Which data structure uses LIFO?", answers: ["Array","Int","Stacks","Queues"], correctAnswer: 2),
        Question(question: "A memory location that holds a single letter or number", answers: ["Double","Char","Int","Word"], correctAnswer: 1),
        Question(question: "Who invented C++ ?", answers: ["Larry Wall","Elon Mask","Alan Cooper","Bjarne Stroustrup"], correctAnswer: 3)
    ]
    
    var currentQuestion: Question?
    var currentQuestionIdx = 0
    var mistake = 0
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    
    var score : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        currentQuestion = questions[0]
        setQuestion()
        progressLabel.text = "\(score+1)/\(questions.count)"
    }
    
    @IBAction func answer1Button(_ sender: Any) {
        checkAnswer(idx: 0)
    }
    @IBAction func answer2Button(_ sender: Any) {
        checkAnswer(idx: 1)
    }
    @IBAction func answer3Button(_ sender: Any) {
        checkAnswer(idx: 2)
    }
    @IBAction func answer4Button(_ sender: Any) {
        checkAnswer(idx: 3)
    }
    
    func checkAnswer(idx: Int) {
        if(idx == currentQuestion!.correctAnswer) {
            mistake += 1
        }
        nextQuestion(currentQuestionIdx)
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        if(currentQuestionIdx + 1 < questions.count) {
            currentQuestionIdx += 1
            currentQuestion = questions[currentQuestionIdx]
            setQuestion()
        } else {
            performSegue(withIdentifier: "ShowResults", sender: nil)
        }
    }
    func setQuestion() {
        textView.text = currentQuestion!.question
        answer1Button.setTitle(currentQuestion!.answers[0], for: .normal)
        answer2Button.setTitle(currentQuestion!.answers[1], for: .normal)
        answer3Button.setTitle(currentQuestion!.answers[2], for: .normal)
        answer4Button.setTitle(currentQuestion!.answers[3], for: .normal)
        progressLabel.text = "\(currentQuestionIdx + 1) / \(questions.count)"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ShowResults") {
            let vc = segue.destination as! ResultsViewController
            vc.mistake = mistake
            vc.total = questions.count
        }
    }
    
}

