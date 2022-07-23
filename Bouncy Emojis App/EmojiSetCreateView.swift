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
                EmojiTextField(text: $emojis, placeholder: "Emoji Set Emojis")
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

// copy pasted code
class UIEmojiTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setEmoji() {
        _ = self.textInputMode
    }

    override var textInputContextIdentifier: String? {
           return ""
    }

    override var textInputMode: UITextInputMode? {
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage == "emoji" {
                self.keyboardType = .default // do not remove this
                return mode
            }
        }
        return nil
    }
}

struct EmojiTextField: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String = ""

    func makeUIView(context: Context) -> UIEmojiTextField {
        let emojiTextField = UIEmojiTextField()
        emojiTextField.placeholder = placeholder
        emojiTextField.text = text
        emojiTextField.delegate = context.coordinator
        return emojiTextField
    }

    func updateUIView(_ uiView: UIEmojiTextField, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: EmojiTextField

        init(parent: EmojiTextField) {
            self.parent = parent
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async { [weak self] in
                self?.parent.text = textField.text ?? ""
            }
        }
    }
}

struct EmojiSetCreateView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiSetCreateView(emojiSets: .constant([]))
    }
}
