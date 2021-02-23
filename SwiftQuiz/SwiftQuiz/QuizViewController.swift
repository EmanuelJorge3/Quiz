//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Emanuel on 23/09/19.
//  Copyright © 2019 3MA. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswers: [UIButton]!
    
    var quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viTimer.frame.size.width  = view.frame.size.width
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }
        
        getNewQuiz()
    }
    
    func getNewQuiz() {
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.question
        for i in 0..<quizManager.options.count {
            let option = quizManager.options[i]
            let button = btAnswers[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    func  showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultviewcontroller = segue.destination as! ResultViewController
        resultviewcontroller.totalAnswers = quizManager.totalAnswers
        resultviewcontroller.totalCorrectAnswers = quizManager.totalCorrectAnswers
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let index = btAnswers.index(of: sender)!
        quizManager.validateAnswer(index: index)
        getNewQuiz()
    }
    

}





















