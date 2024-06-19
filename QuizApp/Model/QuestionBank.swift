//
//  QuestionBank.swift
//  QuizApp
//
//  Created by Олеся Скидан on 30.04.2024.
//

import Foundation

class QuestionBank {
    var questionList = [Question]()

    init() {
        // Existing questions
        questionList.append(Question(text: "The Great Wall of China is visible from the moon.", correctAnswer: false))
        questionList.append(Question(text: "Vatican City is the smallest country in the world.", correctAnswer: true))
        questionList.append(Question(text: "An octopus has three hearts.", correctAnswer: true))
        questionList.append(Question(text: "Brazil is the only country in the Americas to have the official language of Portuguese.", correctAnswer: true))
        questionList.append(Question(text: "The capital of Australia is Sydney.", correctAnswer: false))
        questionList.append(Question(text: "The coffee bean is actually a seed inside a bright red berry.", correctAnswer: true))
        questionList.append(Question(text: "Bananas grow on trees.", correctAnswer: false))
        questionList.append(Question(text: "The unicorn is the national animal of Scotland.", correctAnswer: true))
        questionList.append(Question(text: "Venus is the hottest planet in our solar system.", correctAnswer: true))
        questionList.append(Question(text: "An ostrich's eye is bigger than its brain.", correctAnswer: true))
        questionList.append(Question(text: "Goldfish only have a memory of three seconds.", correctAnswer: false))
        questionList.append(Question(text: "Humans can distinguish between over a trillion different smells.", correctAnswer: true))
        questionList.append(Question(text: "Adult human bones account for 14% of the body's total weight.", correctAnswer: false))

        // Additional questions
        questionList.append(Question(text: "Lightning never strikes in the same place twice.", correctAnswer: false))
        questionList.append(Question(text: "Humans share 50% of their DNA with bananas.", correctAnswer: true))
        questionList.append(Question(text: "You can see the Great Wall of China from space.", correctAnswer: false))
        questionList.append(Question(text: "The Twitter bird actually has a name - Larry.", correctAnswer: true))
        questionList.append(Question(text: "A crocodile cannot stick its tongue out.", correctAnswer: true))
        questionList.append(Question(text: "A shrimp's heart is in its head.", correctAnswer: true))
        questionList.append(Question(text: "People can sneeze in their sleep.", correctAnswer: false))
        questionList.append(Question(text: "A duck's quack doesn't echo, and no one knows why.", correctAnswer: false))
        questionList.append(Question(text: "Humans and giraffes have the same number of neck vertebrae.", correctAnswer: true))
        questionList.append(Question(text: "The Atlantic Ocean is the warmest in the world.", correctAnswer: false))
        questionList.append(Question(text: "A day on Venus is longer than a year on Venus.", correctAnswer: true))
        questionList.append(Question(text: "Water boils at 90 degrees Celsius.", correctAnswer: false))
        questionList.append(Question(text: "The Mona Lisa has no eyebrows.", correctAnswer: true))
        questionList.append(Question(text: "Vikings wore horned helmets.", correctAnswer: false))
        questionList.append(Question(text: "Alfred Hitchcock was afraid of eggs.", correctAnswer: true))
        questionList.append(Question(text: "The Eiffel Tower can be 15 cm taller during the summer.", correctAnswer: true))
        questionList.append(Question(text: "Adult cats are lactose intolerant.", correctAnswer: true))
        questionList.append(Question(text: "The human body contains enough bone to make up an entire skeleton.", correctAnswer: true))
        questionList.append(Question(text: "Koalas have fingerprints almost indistinguishable from humans.", correctAnswer: true))
        questionList.append(Question(text: "All the planets in the solar system rotate anticlockwise, except Venus.", correctAnswer: true))
        questionList.append(Question(text: "Fish cannot blink.", correctAnswer: true))
        questionList.append(Question(text: "It is possible to lead a cow upstairs but not downstairs.", correctAnswer: true))
        questionList.append(Question(text: "Birds are dinosaurs.", correctAnswer: true))
        questionList.append(Question(text: "The inventor of the Pringles can is now buried in one.", correctAnswer: true))
        questionList.append(Question(text: "There are 10 times more bacteria in your body than actual body cells.", correctAnswer: true))
        questionList.append(Question(text: "Napoleon was killed during the French Revolution.", correctAnswer: false))
        questionList.append(Question(text: "The hottest chili pepper in the world is the Carolina Reaper.", correctAnswer: true))
        
        shuffleQuestions()
    }
    
    func shuffleQuestions() {
        questionList.shuffle()
    }
}


extension QuestionBank {
    func pickRandomQuestions() -> [Question] {
        return questionList.shuffled().prefix(13).map {$0}
    }
}
