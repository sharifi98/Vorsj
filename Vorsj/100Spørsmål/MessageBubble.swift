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
        HStack {
            // Push outgoing messages to the right and incoming to the left
            if type == .outgoing || type == .rules { Spacer() }
            
            // The main text of the message with specific font, padding, and color based on its type.
            Text(text)
                .font(fontForType())
                .padding(paddingForType())
                .foregroundColor(colorForTextType())
                .background(BubbleShape().fill(colorForBubbleType()))
            
            
            if type == .incoming { Spacer() }
        }
    }

    // MARK: - Helper Functions

    // Define the font based on message type
    private func fontForType() -> Font {
        return .system(size: 16)
    }

    // Adjust padding based on the message type
    private func paddingForType() -> EdgeInsets {
        switch type {
        case .incoming:
            return EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20)
        case .outgoing, .rules:   // Apply same padding for outgoing and rules
            return EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)
        }
    }

    // Define text color based on message type
    private func colorForTextType() -> Color {
        switch type {
        case .incoming, .outgoing, .rules:  // All have white text for now
            return .white
        }
    }
    
    // Define bubble color based on message type
    private func colorForBubbleType() -> Color {
        switch type {
        case .incoming: return Color(UIColor.lightGray)
        case .outgoing: return Color.blue
        case .rules: return Color.green  // New case for rules
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
            MessageBubble(text: "1", type: .incoming)
                .background(Color.black)
                .previewLayout(.sizeThatFits)
            MessageBubble(text: "Sample Question for Preview", type: .outgoing)
                .background(Color.black)
                .previewLayout(.sizeThatFits)
            MessageBubble(text: "Sample Rules for Preview", type: .rules)
                .background(Color.black)
                .previewLayout(.sizeThatFits)
        }
    }
}
