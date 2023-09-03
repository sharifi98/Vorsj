//
//  Background.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 24/08/2023.
//

import SwiftUI


struct Spotify: View {
    var body: some View {
        NavigationView {  // <-- 1. Wrap in NavigationView
            ZStack{
                Background()
                VStack {

                    ScrollView {
                        Cover()

                        VStack{
                            ArtistInfo()
                            Controls()

                            VStack(spacing: 24){
                                trackNavigationLink(name: "Livin On A Prayer", artists: "Bon Jovi", explicit: false, playing: false, filename: "livinonaprayer.json", title: "Livin on a prayer - Bon Jovi", url: "https://open.spotify.com/track/1")
                                
                                trackNavigationLink(name: "Best Song Ever", artists: "One Direction", explicit: false, playing: false, filename: "bestsongever.json", title: "Best Song Ever - One Direction", url: "https://open.spotify.com/track/5T7ZFtCcOgkpjxcuaeZbw0?si=1e4398968b294b7b")
                                
                                trackNavigationLink(name: "Sex On Fire", artists: "Kings Of Leon", explicit: false, playing: false, filename: "sexonfire.json", title: "Sex On Fire - Kings Of Leon", url: "https://open.spotify.com/track/0ntQJM78wzOLVeCUAW7Y45?si=bf6037e43165440a")
                                
                                trackNavigationLink(name: "Dancing Queen", artists: "ABBA", explicit: false, playing: false, filename: "dancingqueen.json", title: "Dancing Queen - ABBA", url: "https://open.spotify.com/track/0GjEhVFGZW8afUYGChu3Rr?si=056b6868a1dc4a8a")
                                
                                trackNavigationLink(name: "I Want It That Way", artists: "Backstreet Boys", explicit: false, playing: false, filename: "iwantitthatway.json", title: "I Want It That Way - Backstreet Boys", url: "https://open.spotify.com/track/47BBI51FKFwOMlIiX6m8ya?si=8851ce5ccf4c4537")
                                
                                trackNavigationLink(name: "Lay All Your Love On Me", artists: "ABBA", explicit: false, playing: false, filename: "layallyourloveonme.json", title: "Lay All Your Love On Me - ABBA", url: "https://open.spotify.com/track/4euAGZTszWPrriggYK0HG9?si=592be5da6bec4afb")
                                
                                trackNavigationLink(name: "Forever Alone", artists: "Kakkmaddafakka", explicit: false, playing: false, filename: "foreveralone.json", title: "Forever Alone - Kakkmaddafakka", url: "https://open.spotify.com/track/2ABslCJtxwLFLCUHWctSaL?si=4ced1e4dbbc74e08")
                                
                                trackNavigationLink(name: "Fairy Tale", artists: "Alexander Rybak", explicit: false, playing: false, filename: "fairytale.json", title: "Fairy Tale - Alexander Rybak", url: "https://open.spotify.com/track/6NgYIETQ8U72CVfkzYhK30?si=f6ab3cc5d81a4d77")
                                
                                trackNavigationLink(name: "Take On Me", artists: "A-Ha", explicit: false, playing: false, filename: "takeonme.json", title: "Take On Me - A-Ha", url: "https://open.spotify.com/track/2WfaOiMkCvy7F5fcp2zZ8L?si=a3080fc99b764186")
                                trackNavigationLink(name: "Sorry", artists: "AF1", explicit: false, playing: false, filename: "sorry.json", title: "Sorry - AF1", url: "https://open.spotify.com/track/12C1wQ5YJMiOtwunC9Ds6N?si=071312f28a384e6d")
                                
                                trackNavigationLink(name: "Viva La Vida", artists: "Coldplay", explicit: false, playing: false, filename: "vivalavida.json", title: "Viva La Vida - Coldplay", url: "https://open.spotify.com/track/1mea3bSkSGXuIRvnydlB5b?si=593889fd373147c2")
                                
                            }.padding(.top)
                        }
                        Spacer()
                    }
                }
                .padding(.bottom, 60.0)
                VStack{
                    MediaPlayer()
                }
                .background(Color(#colorLiteral(red: 0.1568410099, green: 0.1568752527, blue: 0.1568388343, alpha: 1)))
                .offset(y: UIScreen.main.bounds.height / 2 - 75)
            }.foregroundColor(.white)
        }  // <-- Closing NavigationView
    }
    
    @ViewBuilder
    func trackNavigationLink(name: String, artists: String, explicit: Bool, playing: Bool, filename: String, title: String, url: String) -> some View {
        NavigationLink(destination: KaraokeView(filename: filename, title: title, url: url)) {
            Track(name: name, artists: artists, explicit: explicit, playing: playing, filename: filename)
        }
    }
}


struct Spotify_Previews: PreviewProvider {
    static var previews: some View {
        Spotify()
    }
}



struct Background: View{
    
    let colors: [Color] = [Color(#colorLiteral(red: 0.1407667696, green: 0.5089942217, blue: 0.5972044468, alpha: 1)), Color(#colorLiteral(red: 0.1079011187, green: 0.3485074937, blue: 0.4073579013, alpha: 1)), Color(#colorLiteral(red: 0.09506385773, green: 0.2428356409, blue: 0.2807130218, alpha: 1)), Color(#colorLiteral(red: 0.08821473271, green: 0.1449819803, blue: 0.1618441939, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1))]
    
    var body: some View{
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct Cover: View{
    var body: some View{
        ZStack(alignment: .top){
            Image("tobias")
                .resizable()
                .frame(width: 220, height: 220)
                .shadow(radius: 5)
            
            
            
            
        }
        VStack(alignment: .center) {
            Text("Sett en av sangene på, følg teksten og syng når det gjelder for deg. De som synger skal reise seg opp, mens de andre skal drikke.")
                .font(.caption)
                .frame(maxWidth: 300)
                .multilineTextAlignment(.center)  // This line aligns the text to the center
        }
        .padding(10)
    }
}

struct ArtistInfo: View{
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text("Karaoke")
                    .font(.system(size: 25, weight: .bold))
                
                HStack{
                    Image("trym")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .clipShape(Circle())
                    
                    Text("Trym Hjellbakk")
                        .font(.system(size: 14, weight: .bold))
                }
            }
            .padding(.leading)
            .padding(.top)
            
            Spacer()
        }
    }
}

struct Controls: View{
    var body: some View{
        HStack{
            VStack(alignment: .leading, spacing: 10){
                HStack{
                    Text("Album")
                    Circle()
                        .frame(width: 3, height: 3)
                    Text("2017")
                }
                
                HStack(spacing: 25){
                    Image(systemName: "heart")
                    Image(systemName: "arrow.down.circle")
                    Image(systemName: "ellipsis")
                }
                .font(.system(size: 25))
            }
            .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
            .font(.system(size: 14))
            
            Spacer()
            
            ZStack(alignment: .bottomTrailing){
                ZStack{
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color(#colorLiteral(red: 0.1079577729, green: 0.7236167789, blue: 0.3314852118, alpha: 1)))
                    
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                }
                
                ZStack{
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    
                    Image(systemName: "shuffle")
                        .foregroundColor(Color(#colorLiteral(red: 0.1079577729, green: 0.7236167789, blue: 0.3314852118, alpha: 1)))
                        .font(.system(size: 10))
                }
            }
        }.padding(.horizontal)
    }
}

struct Track: View {
    let name: String
    let artists: String
    let explicit: Bool
    let playing: Bool
    // Note: The filename parameter isn't used directly in this view, but it's kept for consistency with the parent view.
    let filename: String

    var body: some View {
        HStack {
            // Maybe an icon or image representing the song
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)

                Text(artists)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            if explicit {
                Text("E")
                    .font(.caption)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 2)
                    .background(Color.red)
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal)
    }
}


struct MediaPlayer: View{
    var body: some View{
        HStack{
            HStack{
                Image("trym")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                VStack(alignment: .leading){
                    Text("G.O.A.T.")
                    Text("Trym Hjellbakk")
                        .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
                }
                .font(.system(size: 14))
            }
            
            Spacer()
            
            HStack(spacing: 35){
                Image(systemName: "hifispeaker")
                    .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
                Image(systemName: "play.fill")
            }
            .font(.system(size: 25))
            .padding(.trailing)
        }
        .border(Color.black, width: 0.3)
    }
}

struct Menu: View{
    var body: some View{
        HStack{
            
            VStack(spacing: 8){
                Image(systemName: "house")
                    .font(.system(size: 20))
                
                Text("Home")
                    .font(.system(size: 12))
            }
            .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
            
            Spacer()
            
            VStack(spacing: 8){
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 20))
                
                Text("Search")
                    .font(.system(size: 12))
            }
            
            Spacer()
            
            VStack(spacing: 8){
                Image(systemName: "text.justifyright")
                    .rotationEffect(.degrees(90))
                    .font(.system(size: 20))
                
                Text("Home")
                    .font(.system(size: 12))
            }
            .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
        }
        .padding(.bottom, 30)
        .padding(.top, 2)
        .padding(.horizontal, 40)
    }
}



