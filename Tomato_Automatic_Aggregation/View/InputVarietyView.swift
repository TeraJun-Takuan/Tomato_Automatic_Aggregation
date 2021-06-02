//
//  GetDataFromBarcodereader.swift
//  Wireless Test
//
//  Created by Terao Jumpei on 2021/05/26.
//

import SwiftUI

extension UIApplication {
    // キーボードを下げる
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct InputVarietyView: View {
    // 共有オブジェクト
    @EnvironmentObject var setData: ShareData
    // シートが開いている状態
    @Binding var isPresented: Bool
    // 選択されているタブ
    @State var selectedTab = 1
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab){
                InputByBarcodeReaderTabView(isPresented: $isPresented)
                    .tabItem {
                        Text("バーコードリーダーで入力")
                    }
                    .tag(1)
                InputByPickerTabView()
                    .tabItem {
                        Text("一覧から入力")
                    }
                    .tag(2)
            }
            .navigationBarTitle("データ入力")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("閉じる"){
                        isPresented = false
                    }
                }
            }
        }
    }
}

struct GetDataFromBarcodereader_Previews: PreviewProvider {
    static var previews: some View {
        InputVarietyView(isPresented: Binding.constant(false)).environmentObject(ShareData())
    }
}