//
//  EmojiSetCreateView.swift
//  Bouncy Emojis App
//
//  Created by TAY KAI QUAN on 23/7/22.
//

import SwiftUI

struct EmojiSetCreateView: View {
    @State var name: String = ""
    @State var emojis: String = ""
    @State var bgColor: Color = .init(red: 0.8, green: 0.8, blue: 0.8)

    @Binding var emojiSets: [EmojiSet]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Form {
            Section("Emoji Set Details") {
                TextField("Set Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                TextField("Emojis (split by comma)", text: $emojis)
                    .textFieldStyle(.roundedBorder)
                ColorPicker("Background color", selection: $bgColor)
            }
            Section {
                HStack {
                    Spacer()
                    Button("Save Emoji Set") {
                        guard !name.isEmpty && !emojis.isEmpty else { return }
                        emojiSets.append(EmojiSet(name: name,
                            emojis: emojis.split(separator: ",").map { String($0) },
                            color: bgColor ))
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                }
            }
        }
        .navigationTitle("New Emoji Set")
    }
}

struct EmojiSetCreateView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiSetCreateView(emojiSets: .constant([]))
    }
}
