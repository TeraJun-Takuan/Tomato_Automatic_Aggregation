//
//  ShareData.swift
//  Tomato_Automatic_Aggregation
//
//  Created by TeraJun on 2021/05/26.
//

import Foundation

class Variety: ObservableObject {
    @Published var InputVarietyID: String = ""
    @Published var InputVarietyName: String = ""
    
    class VarietiesDataBase: Codable {
        var id: String
        var name: String
    }
    @Published var Varieties: [VarietiesDataBase] = Bundle.main.decodeJSON("varieties.json")
}

