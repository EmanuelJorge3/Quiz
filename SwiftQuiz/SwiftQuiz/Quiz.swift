//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Emanuel on 23/09/19.
//  Copyright © 2019 3MA. All rights reserved.
//

import Foundation


class Quiz {
    
    let question: String
    let options: [String]
    private let correctedAnswer: String
    
    init(question: String, options: [String], correctedAnswer: String) {
        self.question = question
        self.options = options
        self.correctedAnswer = correctedAnswer
    }
    
    func validateOption(_ index: Int) -> Bool {
        let answer = options[index]
        return answer == correctedAnswer
    }
    
    deinit {
        print("Liberou quiz da memoria")
    }
}
