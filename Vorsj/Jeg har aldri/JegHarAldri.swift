//
//  JegHarAldri.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 31/08/2023.
//

import SwiftUI

struct JegHarAldri: View {
    
    @State var questions: [Question]
    
    var filename: String
    var title: String
    
    init(filename: String, title: String) {
        self.filename = filename
        self.title = title
        _questions = State(initialValue: load(filename))
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text("JEG HAR ALDRI")
                        .font(.title)
                    .foregroundColor(.red)
                    Text("\(title)")
                        .font(.headline)
                        .foregroundStyle(.white)
                }
            }
            
                Text("Les opp en påstand, de som har gjort det skal drikke en slurk")
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundStyle(.secondary)
            
            Section {
                ForEach(0..<questions.count, id: \.self) { index in
                    HStack {
                        Text("\(index+1)")
                            .font(.headline)
                            .foregroundColor(.red)
                            .padding()
                        Text("\(questions[index].question)")
                            .bold()
                    }
                    
                }
            }
            .listRowBackground(Rectangle()
                                .background(Color.clear)
                                .foregroundColor(.gray)
                                .opacity(0.3)
            )
            
        }
        .listStyle(.plain)
        
    }
}

struct JegHarAldri_Previews: PreviewProvider {
    static var previews: some View {
        JegHarAldri(filename: "JegHarAldriVolume1.json", title: "Volume 1")
    }
}


