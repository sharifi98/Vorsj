//
//  ChuggEllerSannhet.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 16/08/2023.
//

import SwiftUI

struct ChuggEllerSannhetVolume: View {
    @State var questions: [Question]
    
    var filename: String
    var title: String
    var volumeColor: Color
    
    init(filename: String, title: String, volumeColor: Color = .yellow) {
        self.filename = filename
        self.title = title
        self.volumeColor = volumeColor
        _questions = State(initialValue: load(filename))
    }
    
    var body: some View {
        List {
            Section(header: VStack(alignment: .leading) {
                Text("CHUGG ELLER")
                    .font(.title)
                    .foregroundColor(.secondary)
                HStack {
                    Text("SANNHET")
                        .font(.title)
                        .foregroundColor(.yellow)
                    Text(title)
                        .font(.headline)
                }
            }
            ) {
                Text("Si et tall fra 1-105\n\nHuk av på boksen når tallet har blitt tatt hvis du vil holde styr\n\nSier noen samme tall, må de chugge\n\nGjør man ikke utfordringen drikker man 5 slurker og utfordringen står åpne for andre\n\nGjør man utfordringen drikker ALLE 2 slurker \n\nTipset blir nemlig å huske tallene som blir sagt for å unngå å chugge.")
            }
            
            Spacer()
            
            Section {
                ForEach(0..<questions.count, id: \.self) { index in
                    Toggle(isOn: Binding(
                        get: { self.questions[index].isChecked ?? false },
                        set: { self.questions[index].isChecked = $0 }
                    )) {
                        HStack {
                            Text("\(index+1)")
                                .font(.headline)
                                .foregroundColor(.yellow)
                                .padding()
                            Text("\(questions[index].question)")
                                .bold()
                        }
                    }
                    .toggleStyle(CustomToggleStyle())
                }
            }
            
        }
        .listStyle(.plain)
        
    }
}

struct ChuggEllerSannhetVolume_Previews: PreviewProvider {
    static var previews: some View {
        ChuggEllerSannhetVolume(filename: "ChuggEllerSannhetVolume1.json", title: "Chugg eller sannhet", volumeColor: .blue)
    }
}
