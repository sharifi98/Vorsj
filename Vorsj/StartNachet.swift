//
//  StartNachet.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 16/09/2023.
//

import SwiftUI

struct StartNachet: View {
    
    var filename: String
    var title: String
    let questions: [Question]
    
    init(filename: String, title: String) {
        self.filename = filename
        self.title = title
        self.questions = load(self.filename)
    }
    
    var body: some View {
        VStack {
            
            ScrollView {
                ruleView
                questionsView
            }
            ComposeArea()
            ChatsTabBarView()
        }
        .navigationTitle(self.title)
        .navigationBarTitleDisplayMode(.large)
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

struct StartNachet_Previews: PreviewProvider {
    static var previews: some View {
        StartNachet(filename: "startnachet.json", title: "Start Nachet")
    }
}
