//
//  ThirdLevelViewController.swift
//  QuizApp
//
//  Created by Олеся Скидан on 30.04.2024.
//

import UIKit
import WebKit

class ThirdLevelViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    var questionBank = QuestionBank()
    var currentQuestions: [Question] = []
    var selectedAnswer: Bool = false
    var questionNumber = 0
    var score = 0
    var timer: Timer?
    var secondsRemaining = 25  // Встановлюємо час для таймера
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        selectedAnswer = (sender.tag == 1)
        checkAnswer()
        loadNextQuestion()
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1)/13"
        timerLabel.text = "\(secondsRemaining) seconds left"
        progressBarUpdate()
    }
    
    func progressBarUpdate() {
        let totalWidth = view.frame.size.width
        let progress = CGFloat(questionNumber + 1) / 13
        progressLabel.frame.size.width = totalWidth * progress
    }
    
    func loadNextQuestion() {
        if questionNumber < currentQuestions.count - 1 {
            questionNumber += 1
            questionLabel.text = currentQuestions[questionNumber].questionText
            updateUI()
        } else {
            endGame()
        }
    }
    
    func checkAnswer() {
        let correctAnswer = currentQuestions[questionNumber].answer
        if selectedAnswer == correctAnswer {
            score += 1
            updateUI()
        }
    }
    
    func endGame() {
        timer?.invalidate()
        showFinishAlert()
    }
    
    func showFinishAlert() {
        let userID = UserDataService.shared.getUserID()!
        let score = score
        
        let alert = UIAlertController(title: "Game Over", message: "What would you like to do next?", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Restart", style: .default) { _ in
            self.resetGame()
        }
        let saveResultsAction = UIAlertAction(title: "Save Results", style: .default) { _ in
            self.saveResults(userID: userID, score: score)
        }
        alert.addAction(restartAction)
        alert.addAction(saveResultsAction)
        present(alert, animated: true, completion: nil)
    }
    
    func saveResults(userID: String, score: Int) {
        guard let url = URL(string: "https://quiz-appservice.bleksi.com/quiz-redirect?user-id=\(userID)&score=\(score)") else { return }
        let webView = WKWebView(frame: self.view.bounds)
        webView.load(URLRequest(url: url))
        view.addSubview(webView)
    }
    
    func resetGame() {
        questionNumber = 0
        score = 0
        secondsRemaining = 25
        currentQuestions = questionBank.pickRandomQuestions()
        updateUI()
        startTimer()
        questionLabel.text = currentQuestions[questionNumber].questionText
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            secondsRemaining -= 1
            timerLabel.text = "\(secondsRemaining) seconds left"
        } else {
            endGame()
        }
    }
}
