//
//  ContentView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    let items = [
        Item(title: "100 spørsmål", subtitle: "Snusboks leken, Volume 1-9 og mer", destinationView: AnyView(HundredQuestionsListView())),
        Item(title: "Chugg eller sannhet", subtitle: "Volume 1-9", destinationView: AnyView(ChuggEllerSannhetListView())),
        //Item(title: "Dab or die", subtitle: "Volume 1-9", destinationView: AnyView(HundredQuestionsListView())),
        //Item(title: "LFG", subtitle: "Volume 1-9", destinationView: AnyView(HundredQuestionsListView()))
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
                                    Image("trym")
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
                .listRowBackground(Color.pink)
            }
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

