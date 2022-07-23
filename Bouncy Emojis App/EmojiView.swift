//
//  EmojiView.swift
//  Bouncy Emojis App
//
//  Created by TAY KAI QUAN on 23/7/22.
//

import SwiftUI

struct EmojiView: View {
    var emojiSet: EmojiSet

    @State var selectedEmojis: [String] = []

    var body: some View {
        VStack {
            ZStack {
                emojiSet.color
                    .frame(height: 100)
                ScrollView(.horizontal) {
                    HStack {
                        Spacer()
                        ForEach(emojiSet.emojis, id: \.self) { emoji in
                            Button {
                                selectedEmojis.append(emoji)
                            } label: {
                                ZStack {
                                    Color.init(red: 0.2,
                                               green: 0.2,
                                               blue: 0.2,
                                               opacity: 0.2)
                                        .cornerRadius(10)
                                    Text(emoji)
                                        .font(.system(size: 60))
                                }.frame(height: 80)
                            }
                        }
                        Spacer()
                    }
                }.frame(height: 100)
            }
            BouncyView(emojis: selectedEmojis) { surface in
                switch surface {
                case .emoji:
                    print("Crashed into another emoji")
                case .wall:
                    print("Crashed into wall")
                }
            }
        }.navigationTitle(emojiSet.name)
    }
}

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiView(emojiSet: EmojiSet(name: "Fruits",
            emojis: ["🍌", "🍎", "🍓", "🍉", "🍍", "🥑"]))
    }
}
