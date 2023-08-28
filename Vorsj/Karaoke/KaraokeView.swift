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
    
    
    func gradientBackgroundColor(for index: Int) -> LinearGradient {
        if index % 2 == 0 {
            return LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.5), Color.purple.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
        } else {
            return LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.5), Color.gray.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
        }
    }

    
    var body: some View {
        NavigationStack {
            ScrollView {
                
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
                
                 
                VStack(spacing: 10) {  // This spacing is the gap between each song entry
                    ForEach(songs, id: \.hvem) { song in
                        VStack {
                            VStack(alignment: .trailing) {
                                Text(song.hvem)

                                    .font(.system(size: 12))
                            }
                            VStack(alignment: .leading) {
                                Text(song.sangtekst)
                                    .padding(5)
                                    .bold()
                                    .multilineTextAlignment(.center)
                                
                            }
                        }
                        .frame(width: 350, height: 120)  // Setting a fixed frame size here
                        .background(gradientBackgroundColor(for: songs.firstIndex(where: { $0.hvem == song.hvem }) ?? 0))
                        .cornerRadius(10)
                    }
                }
                .padding()

            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



#Preview {
    KaraokeView(filename: "livinonaprayer.json", title: "Livin on a prayer - Bon Jovi", url: "https://open.spotify.com/track/37ZJ0p5Jm13JPevGcx4SkF?si=3ee9c7113cc04e61")
}
