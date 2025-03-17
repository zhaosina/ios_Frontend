//
//  Item.swift
//  TOEFLspeaking
//
//  Created by admin on 2025/3/17.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
