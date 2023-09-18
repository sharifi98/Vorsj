//
//  QuizView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 18/09/2023.
//
import SwiftUI

struct QuizView: View {
    
    
    var filename: String
    var title: String
    let questions: [QuizQuestion]
    
    init(filename: String, title: String) {
        self.filename = filename
        self.title = title
        self.questions = load(filename)
        self.selectedOption = selectedOption
    }
    
    
    
    //var questions: [QuizQuestion] = load("Level1.json")
    @State private var selectedOption: String?
    
    let candyBlue = Color(red: 0.3, green: 0.9, blue: 1.0, opacity: 0.8)

     
    var body: some View {
        ScrollView {
            
            Text(title)
                .font(.title)
            
            VStack(alignment: .center, spacing: 20) {
                ForEach(questions) { question in
                    VStack(alignment: .center, spacing: 10) {
                        Text(question.question)
                            .italic()
                            .bold()
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil) // Allow text to wrap to the next line
                            .minimumScaleFactor(0.9) // Adjust font size if needed (down to 50% of the original size)

                        VStack{
                            ForEach(question.options.indices, id: \.self) { index in
                                Button(action: {
                                    self.selectedOption = question.options[index]
                                }) {
                                    HStack {
                                        Text("\(self.optionLetter(for: index)). ")
                                            .fontWeight(.bold)
                                        Text(question.options[index])
                                    }
                                    .padding()
                                    .frame(width: 300, height: 50, alignment: .leading)
                                    .background(backgroundColor(for: question.options[index], correctAnswer: question.correctAnswer))
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                }
                            }
                        }
                    }
                    .padding()
                    .frame(width: 350, height: 350, alignment: .center)
                    .background(Color(red: 231/255, green: 90/255, blue: 124/255))
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }

    func optionLetter(for index: Int) -> String {
        let letters = ["A", "B", "C", "D"]
        return letters[safe: index] ?? ""
    }

    func backgroundColor(for option: String, correctAnswer: String) -> Color {
        if selectedOption == option {
            if option == correctAnswer {
                return .green
            } else {
                return .red
            }
        } else {
            return .blue.opacity(0.6)
        }
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(filename: "Level1.json", title: "Vil du bli tusinær?")
    }
}
