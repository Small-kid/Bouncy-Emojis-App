//
//  EmojiSet.swift
//  Bouncy Emojis App
//
//  Created by TAY KAI QUAN on 23/7/22.
//

import Foundation
import SwiftUI

struct EmojiSet: Identifiable {
    var id = UUID()
    var name: String
    var emojis: [String]
    var color: Color = .init(red: 0.8, green: 0.8, blue: 0.8)
}
