//
//  MessageBubble.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import SwiftUI

struct MessageBubble: View {
    
    // Defines the direction and style of the message (incoming vs outgoing).
    enum MessageType {
        case incoming
        case outgoing
        case rules  // New case for rules
    }

    var text: String
    var type: MessageType

    var body: some View {
        if type == .incoming {
            incomingMessageView
        } else if type == .outgoing {
            outgoingMessageView
        } else if type == .rules {
            rulesMessageView
        }
    }

    // MARK: - Subviews

    private var incomingMessageView: some View {
        HStack {
            ZStack(alignment: .bottomLeading) {
                Image("incomingTail")
                    .padding(EdgeInsets(top: 0, leading: -5, bottom: -2, trailing: 0))
                Text(text)
                    .font(fontForType())
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(colorForBubbleType())
                    )
            }
            Spacer() // push the ZStack to the leading edge
        }
        .contextMenu {
            Label("New Mail Message", systemImage: "envelope")
            Label("Send Message", systemImage: "message")
            Label("FaceTime", systemImage: "video")
            Label("FaceTime Audio", systemImage: "phone")
            Label("Add to Contacts", systemImage: "person.crop.circle.badge.plus")
            Label("doc.on.doc", systemImage: "trash")
        }
    }



    private var outgoingMessageView: some View {
        HStack {
            Spacer() // push the ZStack to the trailing edge
            ZStack(alignment: .bottomTrailing) {
                Image("outgoingTail")
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: -2, trailing: -5))
                Text(text)
                    .font(fontForType())
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(colorForBubbleType())
                    )
            }
        }
    }




    private var rulesMessageView: some View {
        HStack {
            Spacer()  // Center the message
            
            Text(text)
                .font(fontForType())
                .padding(paddingForType())
                .foregroundColor(colorForTextType())
                .background(BubbleShape().fill(colorForBubbleType()))
        }
    }

    // MARK: - Helper Functions

    private func fontForType() -> Font {
        return .system(size: 16)
    }

    private func paddingForType() -> EdgeInsets {
        switch type {
        case .incoming:
            return EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20)
        case .outgoing, .rules:   // Apply same padding for outgoing and rules
            return EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)
        }
    }

    private func colorForTextType() -> Color {
        switch type {
        case .incoming, .outgoing, .rules:  // All have white text for now
            return .white
        }
    }
    
    private func colorForBubbleType() -> Color {
        switch type {
        case .incoming: return Color(#colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1607843137, alpha: 1))
        case .outgoing: return Color(#colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1))
        case .rules: return Color.green
        }
    }
}

// Represents the shape of the message bubble.
struct BubbleShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.addRoundedRect(in: rect, cornerSize: CGSize(width: 15, height: 15))
        }
    }
}


// Preview to visually inspect our MessageBubble in different configurations.
struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MessageBubble(text: "miinalainen@gmail.com", type: .incoming)
                .background(Color.black)
                .previewLayout(.sizeThatFits)
            MessageBubble(text: "Hi, how are you?", type: .outgoing)
                .background(Color.black)
                .previewLayout(.sizeThatFits)
            MessageBubble(text: "Sample Rules for Preview", type: .rules)
                .background(Color.black)
                .previewLayout(.sizeThatFits)
        }
    }
}
