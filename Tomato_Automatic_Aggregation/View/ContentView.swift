//
//  ContentView.swift
//  Wireless Test
//
//  Created by Terao Jumpei on 2021/05/12.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var setData: ShareData
    @State var isShowInputView: Bool = false
    
    var body: some View {
        VStack(){
            ZStack(){
                HStack(){
                    Spacer()
                    Button("データ入力"){
                        isShowInputView = true
                    }
                    .padding()
                    .sheet(isPresented: $isShowInputView){
                        InputVarietyView(isPresented: self.$isShowInputView)
                            .environmentObject(setData)
                    }
                }
                Text("バーコードリーダーからデータ取得のテスト").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding()
            }
            Spacer()
            

            Text("バーコードで得たデータ：" + setData.varietyID).padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ShareData())
    }
}
