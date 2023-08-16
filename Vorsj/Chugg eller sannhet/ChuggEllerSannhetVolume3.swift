//
//  ChuggEllerSannhetVolume3.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 16/08/2023.
//

import SwiftUI

struct ChuggEllerSannhetVolume3: View {
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
                    Text("VOL 2")
                        .font(.headline)
                }
                
                }
            ) {
                Text("Si et tall fra 1-90. Hvis personen ikke vil svare må de chugge. Hvis personen sier et tall som er sagt, så må alle drikke.")
            }
            
            Section {
                ForEach(0..<questions.count, id: \.self) { index in
                    Toggle(isOn: Binding(
                        get: { self.questions[index].isChecked ?? false },
                        set: { self.questions[index].isChecked = $0 }
                    )) {
                        Text("\(index+1): \(questions[index].question)")
                    }
                    .toggleStyle(CustomToggleStyle())
                }
            }
        }
    }
}

struct ChuggEllerSannhetVolume3_Previews: PreviewProvider {
    static var previews: some View {
        ChuggEllerSannhetVolume3(filename: "ChuggEllerSannhetVolume3.json", title: "Chugg eller sannhet")
    }
}
