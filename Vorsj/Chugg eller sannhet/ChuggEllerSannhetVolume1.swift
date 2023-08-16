//
//  ChuggEllerSannhet.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 16/08/2023.
//

import SwiftUI

struct ChuggEllerSannhetVolume1: View {
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
            Section(header:
                        VStack(alignment: .leading) {
                    Text("CHUGG ELLER")
                        .font(.title)
                        .foregroundColor(.secondary)
                HStack {
                    Text("SANNHET")
                            .font(.title)
                        .foregroundColor(.pink)
                    Text("VOL 1")
                        .font(.headline)
                }
                
                }
            ) {
                Text("Si et tall fra 1-105\n\nHuk av på boksen når tallet har blitt tatt hvis du vil holde styr\n\nSier noen samme tall, må de chugge\n\nGjør man ikke utfordringen drikker man 5 slurker og utfordringen står åpne for andre\n\nGjør man utfordringen drikker ALLE 2 slurker \n\nTipset blir nemlig å huske tallene som blir sagt for å unngå å chugge.")
            }
            
            Section {
                ForEach(0..<questions.count, id: \.self) { index in
                    Toggle(isOn: Binding(
                        get: { self.questions[index].isChecked ?? false },
                        set: { self.questions[index].isChecked = $0 }
                    )) {
                        Text("\(index+1): \(questions[index].question)")
                    }
                    .toggleStyle(CustomToggleStyle())  // Applying the custom toggle style here
                }
            }
        }
    }
}

struct ChuggEllerSannhetVolume1_Previews: PreviewProvider {
    static var previews: some View {
        ChuggEllerSannhetVolume1(filename: "ChuggEllerSannhetVolume1.json", title: "Chugg eller sannhet")
    }
}
