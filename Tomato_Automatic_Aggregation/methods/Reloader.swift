//
//  Reloader.swift
//  Tomato_Automatic_Aggregation
//
//  Created by Terao Jumpei on 2021/06/06.
//

import Foundation
import SwiftUI

class Reloader: ObservableObject {
    @Published var value: String = ""
    @State private var roop: Int = 0
    private var timer = Timer()
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _  in
            self.value = ""
            self.roop = Int.random(in: 0 ... 20)
            for _ in 0 ... self.roop {
                self.value += " "
            }
        }
    }
}
