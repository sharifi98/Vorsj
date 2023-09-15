//
//  HundredQuestionsListView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import SwiftUI

struct HundredQuestionsListView: View {
    let buttonsData = [
        ("5050.json", "50/50", "%", Color.red),
        ("Volume1.json", "Utgave 1", "⭐️", Color.green),
        ("Volume2.json", "Utgave 2", "💫", Color.blue),
        ("Volume3.json", "Utgave 3", "🎊", Color.orange),
        ("Volume4.json", "Utgave 4 (DRØY)", "🍺", Color.yellow),
        ("Volume41.json", "Utgave 8 (DRØY) ", "👙", Color.yellow),
        ("Volume5BI.json", "Utgave 5 (BI)", "🎓", Color.purple),
        ("Volume6.json", "Utgave 69 (Sambucas)", "🥃", Color.yellow),
        ("Volume7.json", "Utgave 7", "👽", Color.pink),
        ("Kompliment.json", "Kompliment", "💕", Color.pink),
    ]
    
    //("Parleken.json", "Duoleken", "💃🏼", Color.gray),
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        
        NavigationStack {
            List {
                Section {
                    ForEach(0..<buttonsData.count, id: \.self) { index in
                        let (filename, title, emoji, _) = buttonsData[index]
                        NavigationLink(destination: HundredView(filename: filename, title: title)) {
                            HStack {
                                Text(emoji)
                                Text(title)
                            }
                        }
                    }
                    .listRowBackground(Color(#colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1607843137, alpha: 1)))

                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("trym")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                        Text("100 Spørsmål")
                        Image(systemName: "chevron.right")
                            .font(.system(size: 10))
                    }
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            
            
            
            ComposeArea()
        }
        
        /*
         NavigationStack {
         ScrollView {
         
         VStack {
         Text("HUNDRE")
         .foregroundColor(.secondary)
         .font(.largeTitle)
         Text("SPØRSMÅL.")
         .foregroundColor(.pink)
         .font(.largeTitle)
         }
         
         LazyVGrid(columns: columns, spacing: 20) {
         ForEach(buttonsData, id: \.0) { (filename, title, emoji, color) in
         NavigationLink(destination: HundredView(filename: filename, title: title)) {
         VStack {
         Text(emoji)
         .font(.largeTitle)
         Text(title)
         }
         .padding()
         .frame(minWidth: 100, maxWidth: .infinity, minHeight: 150, maxHeight: .infinity)
         .background(.white)
         .cornerRadius(10)
         .foregroundColor(.black)
         .overlay(
         RoundedRectangle(cornerRadius: 10)
         .stroke(Color.white.opacity(1), lineWidth: 3)
         )
         .scaleEffect(1.03) // Slight scaling to give the hovering effect
         }
         
         }
         }
         .padding()
         }
         }
         */
    }
}

struct HundredQuestionsListView_Previews: PreviewProvider {
    static var previews: some View {
        HundredQuestionsListView()
    }
}

