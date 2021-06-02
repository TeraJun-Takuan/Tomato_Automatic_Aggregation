//
//  ShareData.swift
//  Wireless Test
//
//  Created by Terao Jumpei on 2021/05/26.
//

import Foundation

class ShareData: ObservableObject {
    @Published var varietyID: String = ""
    @Published var varietyName: String = ""
    @Published var isUsingBarcodeReader: Bool = true
}