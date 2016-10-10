//
//  ViewController.swift
//  Quiz
//
//  Created by Christian Perrone on 04/10/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //@IBOutlet var questionLabel: UILabel!
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    @IBAction func showAnswer(sender: AnyObject) {
        
        let answer = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    let questions = ["From what cognac is made?", "What is 7+7 ?", "What is the capital of Vermont?"]
    let answers = ["Grapes", "14", "Montpelier"]
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let question = questions[currentQuestionIndex]
        currentQuestionLabel.text = question
        
        
        updateOffScreenLabel()
    }
    
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nextQuestionLabel.alpha = 0
        
    }
    
    func animateLabelTransitions() {
        
        /*let animationClosure = { () -> Void in
            self.questionLabel.alpha = 1
            
        }
        UIView.animate(withDuration: 0.5, animations: animationClosure)*/
        
        /*UIView.animate(withDuration: 0.5, animations: {self.currentQuestionLabel.alpha = 0
        self.nextQuestionLabel.alpha = 1})*/
        
        view.layoutIfNeeded()
        
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear], animations: {self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
            self.view.layoutIfNeeded()},
                       completion: {_ in swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                        swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
        self.updateOffScreenLabel()})

    }
}

