//
//  Question.swift
//  QuizApp
//
//  Created by Олеся Скидан on 30.04.2024.
//

import Foundation
class Question {
    let questionText : String
    let answer : Bool
    init(text : String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
