//
//  Array2D.swift
//  TetrisBattle
//
//  Created by Nguyen Tuan Anh on 12/12/17.
//  Copyright © 2017 Nguyen Tuan Anh. All rights reserved.
//


class Array2D<T> {
    let columns: Int
    let rows: Int
    var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        array = Array<T?>(repeating: nil, count: rows * columns)
    }
    
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[(row * columns) + column]
        }
        set(newValue) {
            array[(row * columns) + column] = newValue
        }
    }
}
