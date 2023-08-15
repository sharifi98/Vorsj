//
//  Volume5BI.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import SwiftUI

struct Volume5BI: View {
    
    let questions: [Question] = load("Volume5BI.json")
 
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(questions) { question in
                        QuestionCardView(question: question)
                    }
                }
                
            }
            .background(Color.gray.opacity(0.2))  // Light gray background for contrast
            .navigationTitle("Volume 5 - BI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Volume5BI_Previews: PreviewProvider {
    static var previews: some View {
        Volume5BI()
    }
}
