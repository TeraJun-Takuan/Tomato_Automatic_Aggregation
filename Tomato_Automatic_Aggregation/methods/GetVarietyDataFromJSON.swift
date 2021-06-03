//
//  GetVarietyDataFromJSON.swift
//  Tomato_Automatic_Aggregation
//
//  Created by Terao Jumpei on 2021/06/03.
//

import Foundation
import UIKit

// Bundleに拡張機能を追加し、JSONファイル読み込みを汎用化
extension Bundle {
    func decodeJSON<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
