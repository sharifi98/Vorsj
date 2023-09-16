//
//  HundredView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import SwiftUI

struct HundredView: View {
    
    var filename: String
    var title: String
    let questions: [Question]
    
    init(filename: String, title: String) {
        self.filename = filename
        self.title = title
        self.questions = load(self.filename)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                customScrollView
                ComposeArea()
            }
            .navigationTitle(self.title)
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    // This is your custom ScrollView, extracted as a computed property
    private var customScrollView: some View {
        ScrollView {
            VStack {
                ruleView
                questionsView
            }
            .background(Color.gray.opacity(0.1))
        }
    }
    
    // Display rule if it exists in the first question
    private var ruleView: some View {
        Group {
            if let rule = questions.first?.rule {
                MessageBubble(text: rule, type: .rules)
                    .padding(.bottom, 10)
            }
        }
    }
    
    // Questions list view
    private var questionsView: some View {
        ForEach(Array(questions.enumerated()), id: \.element.id) { index, question in
            let messageType: MessageBubble.MessageType = index % 2 == 0 ? .incoming : .outgoing
            QuestionCardView(question: question, type: messageType)
        }
    }
}


struct HundredView_Previews: PreviewProvider {
    static var previews: some View {
        HundredView(filename: "Kompliment.json", title: "50/50")
    }
}

