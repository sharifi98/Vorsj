//
//  QuestionCardView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import SwiftUI

struct QuestionCardView: View {
    var question: Question

    var body: some View {
        VStack {
            MessageBubble(text: "\(question.id)", type: .incoming)
            MessageBubble(text: question.question, type: .outgoing)
        }
        .padding([.horizontal, .top], 10)
    }
}


struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuestionCardView(question: Question(id: 1, question: "Sample Question for Preview"))
            // Using a dark background for better visibility in the preview
            QuestionCardView(question: Question(id: 1, question: "Sample Question for Preview"))
                .background(Color.black)
                .previewLayout(.sizeThatFits)
        }
    }
}

