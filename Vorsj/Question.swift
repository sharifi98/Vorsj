//
//  Question.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import Foundation

struct Question: Decodable, Identifiable {
    var id: Int
    var question: String
    var rule: String?
    var isChecked: Bool?
}


