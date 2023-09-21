//
//  HeaderView.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 22/08/2023.
//

import SwiftUI
import Foundation

struct  HeaderView: View {
    @Binding var searchText: String
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            Text("Søker etter \(searchText)?")
                .searchable(text: $searchText)
                .navigationTitle("Vorsj-spill")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading: Button {
                        print("Pressed edit button")
                    } label: {
                        Text("Edit")
                    },
                    
                    trailing: Button {
                        showingSheet.toggle()
                        print("Pressed compose button")
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                        .sheet(isPresented: $showingSheet) {
                            SheetView()
                        }
                    
                )
        }
        .frame(height: 80)
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Kontakt meg på mail eller instagram hvis du har nye leker eller andre forslag")
                .multilineTextAlignment(.center)
                .padding()
            
            Button("Mail") {
                openMail(emailTo: "hossein.sharifi@uib.no",
                         subject: "Vorsj-Spill",
                         body: "...")
            }
            .font(.custom("AvenirNext-Bold", size: 15))
            .frame(width: 150, height: 25)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Link("@hosseinrsharifi", destination: URL(string: "https://www.instagram.com/hosseinrsharifi/")!)
                .font(.custom("AvenirNext-Bold", size: 15))
                .frame(width: 150, height: 25)
                .padding()
                .background(Color.pink)
                .foregroundColor(.white)
                .cornerRadius(8)
            
        }
        .presentationDetents([.medium, .large])
    }
}

func openMail(emailTo:String, subject: String, body: String) {
    if let url = URL(string: "mailto:\(emailTo)?subject=\(subject.fixToBrowserString())&body=\(body.fixToBrowserString())"),
       UIApplication.shared.canOpenURL(url)
    {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

extension String {
    func fixToBrowserString() -> String {
        self.replacingOccurrences(of: ";", with: "%3B")
            .replacingOccurrences(of: "\n", with: "%0D%0A")
            .replacingOccurrences(of: " ", with: "+")
            .replacingOccurrences(of: "!", with: "%21")
            .replacingOccurrences(of: "\"", with: "%22")
            .replacingOccurrences(of: "\\", with: "%5C")
            .replacingOccurrences(of: "/", with: "%2F")
            .replacingOccurrences(of: "‘", with: "%91")
            .replacingOccurrences(of: ",", with: "%2C")
        //more symbols fixes here: https://mykindred.com/htmlspecialchars.php
    }
}


struct  HeaderView_Previews: PreviewProvider {
    @State static var dummySearchText: String = ""
    static var previews: some View {
        HeaderView(searchText: $dummySearchText)
            .preferredColorScheme(.dark)
    }
}

