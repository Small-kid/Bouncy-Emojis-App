//
//  ContentView.swift
//  Bouncy Emojis App
//
//  Created by TAY KAI QUAN on 23/7/22.
//

import SwiftUI

struct ContentView: View {

    @State var emojiSets = [
        EmojiSet(name: "Fruits",
                 emojis: ["🍌", "🍎", "🍓", "🍉", "🍍", "🥑"],
                 color: .init(red: 0.5, green: 0.8, blue: 0.5)),
        EmojiSet(name: "Candy", emojis: ["🍫", "🍭", "🍬"],
                 color: .init(red: 0.5, green: 0.5, blue: 0.8)),
        EmojiSet(name: "Dora Series", emojis: ["👧", "🥾", "🗺", "🎒", "🦊", "🐿", "🐮", "🐓"],
                 color: .init(red: 0.8, green: 0.5, blue: 0.8))
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(emojiSets) { emojiSet in
                    NavigationLink {
                        EmojiView(emojiSet: emojiSet)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(emojiSet.name)
                                .font(.headline)
                            Text(emojiSet.emojis.joined())
                        }
                    }
                }
                .onDelete { indexSet in
                    emojiSets.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    emojiSets.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
            .navigationTitle("Emoji Party :D")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
