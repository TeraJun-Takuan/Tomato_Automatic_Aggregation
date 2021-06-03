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
    // シートが開いている状態
    @Binding var isPresented: Bool
    // バーコードリーダー入力待ちかどうか
    @State var isBarcodeReaderEditing: Bool = false
    // 共有オブジェクト
    @EnvironmentObject var setData: ShareData

    var body: some View {
        ZStack{
            Color.white.onTapGesture {
                UIApplication.shared.endEditing()
            }

            VStack{
                HStack{
                    Text("品種ID:")
                    CustomTextField(text: $setData.varietyID, isFirstResponder: true)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height:30)
                        .onReceive(Just($setData.varietyID), perform: { _ in
                            if maxTextlength < setData.varietyID.count {
                                setData.varietyID = String(setData.varietyID.suffix(1))
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

                Text("ソフトウェアキーボード:")+Text("\(isBarcodeReaderEditing ? "true" : "false")")
            }
        }
    }
}

struct InputByBarcodeReaderTabView_Previews: PreviewProvider {
    static var previews: some View {
        InputByBarcodeReaderTabView(isPresented: Binding.constant(false))
            .environmentObject(ShareData())
    }
}
