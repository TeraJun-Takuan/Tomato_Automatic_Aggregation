//
//  ShareData.swift
//  Tomato_Automatic_Aggregation
//
//  Created by TeraJun on 2021/05/26.
//

import Foundation

class ShareData: ObservableObject {
    @Published var InputVarietyID: String = ""
    @Published var InputVarietyName: String = ""
    @Published var isUsingBarcodeReader: Bool = true
}
