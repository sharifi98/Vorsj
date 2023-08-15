//
//  QuestionView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import SwiftUI

struct QuestionsView: View {
    let questions: [Question] = load("Volume5BI.json")

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(questions) { question in
                    QuestionCardView(question: question)
                }
            }
            .padding(.top, 10)
        }
        .background(Color.gray.opacity(0.1))  // Light gray background for contrast
        .edgesIgnoringSafeArea(.all)
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView()
    }
}
