//
//  CalculateCheckDigit.swift
//  Tomato_Automatic_Aggregation
//
//  Created by Terao Jumpei on 2021/06/03.
//

import Foundation
import UIKit

class CalculateCheckDigit: NSObject{
    // チェックデジットを計算し、誤りがあればtrue、誤りがなければfalseを返す
    class func isErrorInBarcode(_ code: String) -> Bool {
        // ITFコードの桁数
        let ITF_DIGIT: Int = 14
        // 桁数が違ったらtrueを返す
        if code.count != ITF_DIGIT {
            return true
        }
        
        // 引数がInt型にキャストできなければtrueを返す
        if Int(code) == nil {
            return true
        }
        
        // codeをInt型配列に格納
        var codeArray = [Int]()
        
        for i in 0..<code.count {
            let start = code.index(code.startIndex, offsetBy: i)
            let end = code.index(code.startIndex, offsetBy: i+1)
            let num = Int(code[start..<end])
            codeArray.append(num!)
        }
        
        // チェックデジット
        let CHECKDIGIT: Int = codeArray[ITF_DIGIT - 1]
        // Int型配列からチェックデジットを削除(ゼロに置換)
        codeArray[ITF_DIGIT - 1] = 0
        
        // 偶数桁の総和
        var Even_sumAll: Int = 0
        // 奇数桁の総和
        var Odd_sumAll: Int = 0
        
        // 偶数桁・奇数桁の各総和を計算
        for i in 0..<ITF_DIGIT/2 {
            Even_sumAll += codeArray[i * 2]
            Odd_sumAll += codeArray[i * 2 + 1]
        }
        
        // 偶数桁の総和*3+奇数桁の総和
        let sumEvenAndOdd: Int = Even_sumAll * 3 + Odd_sumAll
        
        // チェックデジットの計算結果
        let result: Int = 10 - (sumEvenAndOdd - (sumEvenAndOdd / 10) * 10)
        
        if result == CHECKDIGIT {
            return false
        } else {
            return true
        }
    }
}
