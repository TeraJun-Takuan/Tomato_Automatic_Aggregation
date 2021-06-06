//
//  ContentView.swift
//  Tomato_Automatic_Aggregation
//
//  Created by TeraJun on 2021/05/12.
//

import SwiftUI

struct ContentView: View {
    // Reloaderのインスタンス作成
    @ObservedObject var reloader = Reloader()
    // データ入力画面が表示されているか
    @State var isShowInputView: Bool = false
    
    var body: some View {
        VStack(){
            ZStack(){
                HStack(){
                    Text("\(reloader.value)")
                    Spacer()
                    Button("\(isShowInputView ? "入力中" : "データ入力")"){
                       isShowInputView = true
                    }
                    .sheet(isPresented: $isShowInputView){
                       InputVarietyView(isPresented: self.$isShowInputView)
                    }
                    .padding()
                    
                }
                Text("ミニトマト自動集計").font(.title).fontWeight(.bold).padding()
                
            }
            Spacer()
           
            VStack(){
                HStack(){
                    Text("品種ID：" + Variety.InputVarietyID)
                    Spacer()
                }
                .frame(width: 250.0)
                HStack(){
                    Text("品種名：" + Variety.InputVarietyName)
                    Spacer()
                }.frame(width: 250.0)
            }.padding()
            Spacer()
        }
        .onAppear {
            reloader.start()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
