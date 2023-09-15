//
//  ContentView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showWelcomeSheet = false
    @State private var searchText = ""
    
    

    
    let items = [
        Item(title: "100 spørsmål",
             subtitle: "Snusboks leken, Volume 1-7 og mer",
             destinationView: AnyView(HundredQuestionsListView()),
             image: Image("chugg"))
,
        Item(title: "Chugg eller sannhet", 
             subtitle: "Volume 1-3",
             destinationView: AnyView(ChuggEllerSannhetListView()),
             image: Image("anders")),
        
        Item(title: "Jeg har aldri", 
             subtitle: "Volume 1-9",
             destinationView: AnyView(JegHarAldriListView()),
             image: Image("mats")),
        
        Item(title: "Karaoke", 
             subtitle: "Sett en av sangene på, følg teksten og syng når det gjeld..",
             destinationView: AnyView(KaraokeListView()),
             image: Image("pimp"))
        
    ]
    
    var filteredItems: [Item] {
        items.filter { item in
            searchText.isEmpty || item.title.lowercased().contains(searchText.lowercased())
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(searchText: $searchText)
                List {
                    Section {
                        ForEach(filteredItems) { item in
                            NavigationLink(destination: item.destinationView) {
                                HStack {
                                    item.image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                    VStack(alignment: .leading) {
                                        Text(item.title)
                                            .font(.headline)
                                        Text(item.subtitle)
                                            .foregroundColor(.secondary)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            
            
        }
        .onAppear {
            if UserDefaults.standard.object(forKey: "appOpenedBefore") == nil {
                showWelcomeSheet = true
            }
        }
        .sheet(isPresented: $showWelcomeSheet) {
               WelcomeSheet(onDismiss: {
                   UserDefaults.standard.set(true, forKey: "appOpenedBefore")
                   showWelcomeSheet = false
               })
           }

    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let destinationView: AnyView
    let image: Image
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
        .frame(minWidth: 100, maxWidth: 300, minHeight: 50, maxHeight: .infinity)
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .foregroundColor(.white)

    }
}

