//
//  ContentView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    Text("VELG EN")
                        .foregroundColor(.secondary)
                        .font(.largeTitle)
                    
                    Text("DRIKKELEK.")
                        .foregroundColor(.pink)
                        .font(.largeTitle)
                    
                }
                ExtractedView(destination: HundredQuestionsListView(), title: "100 Spørsmål", color: .blue)
                ExtractedView(destination: HundredQuestionsListView(), title: "100 Spørsmål", color: .red)
                ExtractedView(destination: HundredQuestionsListView(), title: "100 Spørsmål", color: .green)


            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView<Destination: View>: View {
    let destination: Destination
    let title: String
    let color: Color
    
    init(destination: Destination, title: String, color: Color) {
        self.destination = destination
        self.title = title
        self.color = color
    }
    
    var body: some View {
        VStack {
            NavigationLink(destination: destination) {
                Text(title)
            }
        }
        .font(.title)
        .padding()
        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
        .background(color)
        .cornerRadius(10)
        .foregroundColor(.white)
        .shadow(radius: 5)
    }
}

