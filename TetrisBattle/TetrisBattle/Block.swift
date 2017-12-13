//
//  Block.swift
//  TetrisBattle
//
//  Created by Nguyen Tuan Anh on 12/12/17.
//  Copyright © 2017 Nguyen Tuan Anh. All rights reserved.
//


import SpriteKit

let NumberOfColors: UInt32 = 6

enum BlockColor: Int, CustomStringConvertible {
    
    case blue = 0, orange, purple, red, teal, yellow
    
    var spriteName: String {
    switch self {
    case .blue:
        return "blue"
    case .orange:
        return "orange"
    case .purple:
        return "purple"
    case .red:
        return "red"
    case .teal:
        return "teal"
    case .yellow:
        return "yellow"
        }
    }
    
    var description: String {
    return self.spriteName
    }
    
    static func random() -> BlockColor {
        return BlockColor(rawValue:Int(arc4random_uniform(NumberOfColors)))!
    }
}

class Block: Hashable, CustomStringConvertible {
    // Constants
    let color: BlockColor
    
    // Variables
    var column: Int
    var row: Int
    
    // Lazy loading
    var sprite: SKSpriteNode?
    
    var spriteName: String {
    return color.description
    }
    
    var hashValue: Int {
    return self.column ^ self.row
    }
    
    var description: String {
    return "\(color) (\(column), \(row))"
    }
    
    init(column:Int, row:Int, color:BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
}

func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
}
