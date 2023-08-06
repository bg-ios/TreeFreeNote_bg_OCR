//
//  Utility.swift
//  TreeFreeNote
//
//  Created by Vinod Kodavath on 23/07/23.
//

import Foundation

class Utility{
    func current_date() -> String {
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd HH:mm"
        return df.string(from: date)
    }
}
