//
//  QuestionCardView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import SwiftUI

struct QuestionCardView: View {
    var question: Question
    var type: MessageBubble.MessageType

    var body: some View {
        MessageBubble(text: "\(question.id). \(question.question)", type: type)
            .padding([.horizontal, .top], 10)
    }
}

struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuestionCardView(question: Question(id: 1, question: "Sample Question for Preview"), type: .incoming)
            // Using a dark background for better visibility in the preview
            QuestionCardView(question: Question(id: 1, question: "Sample Question for Preview"), type: .outgoing)
                .background(Color.black)
                .previewLayout(.sizeThatFits)
        }
    }
}

