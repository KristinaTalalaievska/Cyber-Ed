//
//  Item.swift
//  Cyber Ed
//
//  Created by Kristina on 2024-06-09.
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
