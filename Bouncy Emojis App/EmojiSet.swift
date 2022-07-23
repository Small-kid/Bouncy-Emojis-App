//
//  EmojiSet.swift
//  Bouncy Emojis App
//
//  Created by TAY KAI QUAN on 23/7/22.
//

import Foundation

struct EmojiSet: Identifiable {
    var id = UUID()
    var name: String
    var emojis: [String]
}
