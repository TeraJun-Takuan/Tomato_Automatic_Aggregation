//
//  InputByBarcodeReaderView.swift
//  Tomato_Automatic_Aggregation
//
//  Created by TeraJun on 2021/05/29.
//

import SwiftUI
import Combine

struct InputByBarcodeReaderTabView: View {
    // テキストの最大入力文字数
    private let maxTextlength: Int = 14
    // バーコードリーダー入力待ちかどうか
    @State var isBarcodeReaderEditing: Bool = false
    // 共有オブジェクト
    @EnvironmentObject var InputData: Variety

    var body: some View {
        ZStack{
            Color.white.onTapGesture {
                UIApplication.shared.endEditing()
            }

            VStack{
                HStack{
                    Text("品種ID:")
                    CustomTextField(text: $InputData.InputVarietyID, isFirstResponder: true)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height:30)
                        .onReceive(Just($InputData.InputVarietyID), perform: { _ in
                            if maxTextlength < InputData.InputVarietyID.count {
                                InputData.InputVarietyID = String(InputData.InputVarietyID.suffix(1))
                            }
                        })
                    Spacer()
                }
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification)){ _ in
                    isBarcodeReaderEditing = true
                }
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification)){ _ in
                    isBarcodeReaderEditing = false
                }
                .padding()
                if InputData.InputVarietyID.isEmpty{
                    Text("")
                        .frame(height:0)
                } else if CalculateCheckDigit.isErrorInBarcode(InputData.InputVarietyID) {
                    Text("入力値が不適切です")
                        .foregroundColor(.red)
                } else {
                    Text("").frame(height:0)
                }

                Text("ソフトウェアキーボード:")+Text("\(isBarcodeReaderEditing ? "true" : "false")")
            }
        }
    }
}

struct InputByBarcodeReaderTabView_Previews: PreviewProvider {
    static var previews: some View {
        InputByBarcodeReaderTabView()
            .environmentObject(Variety())
    }
}
