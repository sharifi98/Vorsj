//
//  Quiz.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 18/09/2023.
//

import Foundation

struct QuizQuestion: Decodable, Identifiable {
    var id: Int
    var question: String
    var options: [String]
    var correctAnswer: String
    

    enum CodingKeys: String, CodingKey {
        case id
        case question
        case options
        case correctAnswer = "correct_answer"
    }
}


