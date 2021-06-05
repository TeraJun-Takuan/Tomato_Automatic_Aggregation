//
//  ContentView.swift
//  Tomato_Automatic_Aggregation
//
//  Created by TeraJun on 2021/05/12.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var InputData: Variety
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
                            .environmentObject(InputData)
                    }
                }
                Text("ミニトマト自動集計").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding()
            }
            Spacer()


            Text("品種ID：" + InputData.InputVarietyID).padding([.top, .leading, .trailing])
            Text("品種名：" + InputData.InputVarietyName).padding([.leading, .bottom, .trailing])
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Variety())
    }
}
