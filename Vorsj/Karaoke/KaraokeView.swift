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
    
    func gradientBackgroundColor(for index: Int) -> LinearGradient {
        let baseColor: Color = index % 2 == 0 ? Color.blue : Color.green
        return LinearGradient(gradient: Gradient(colors: [baseColor.opacity(0.3), baseColor]), startPoint: .top, endPoint: .bottom)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                Link(destination: URL(string: url)!) {
                    HStack {
                        Text("Play on Spotify")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                        Image(systemName: "music.note")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                }
                .padding(.top, 20)
                
                VStack(spacing: 20) {
                    ForEach(0..<songs.count, id: \.self) { index in
                        let song = songs[index]
                        VStack {
                            Text(song.hvem)
                                .font(.system(size: 18, weight: .bold))
                                .padding(.bottom, 5)
                                .multilineTextAlignment(.center)
                            
                            Text(song.sangtekst)
                                .font(.system(size: 16))
                                .padding(10)
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 350, height: 150)
                        .background(self.gradientBackgroundColor(for: index))
                        .cornerRadius(10)
                    }
                }
                .padding(20)

                
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct KaraokeView_Previews: PreviewProvider {
    static var previews: some View {
        KaraokeView(filename: "vivalavida.json", title: "Livin on a prayer - Bon Jovi", url: "https://open.spotify.com/track/37ZJ0p5Jm13JPevGcx4SkF?si=3ee9c7113cc04e61")
    }
}
