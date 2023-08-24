//
//  KaraokeView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 23/08/2023.
//

import SwiftUI

struct KaraokeView: View {
    
    let songs: [Song]
    
    var filename: String
    var title: String
    var url: String
    
    init(filename: String, title: String, url: String) {
        self.filename = filename
        self.title = title
        self.songs = load(self.filename)
        self.url = url
    }
    
    
    let columns: [GridItem] = [
        GridItem(.flexible())
    ]
    
    
    func backgroundColor(for index: Int) -> Color {
        return index % 2 == 0 ? .green : .blue
    }
    
    var body: some View {
        ScrollView {
            
            Text(title)
                .foregroundStyle(.white)
                .font(.title)
            
            Link(destination: URL(string: url)!) {
                HStack {
                    Text("Spill av i Spotify")
                        .foregroundColor(.green)
                    Image(systemName: "music.note")
                        .foregroundColor(.green)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            }

            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(Array(songs.enumerated()), id: \.element.hvem) { index, song in
                    HStack {
                        VStack(alignment: .trailing) {
                            Text(song.hvem)
                                .padding()
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text(song.sangtekst)
                                .padding()
                        }
                    }
                    .background(backgroundColor(for: index))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}



#Preview {
    KaraokeView(filename: "livinonaprayer.json", title: "Livin on a prayer - Bon Jovi", url: "https://open.spotify.com/track/37ZJ0p5Jm13JPevGcx4SkF?si=3ee9c7113cc04e61")
}
