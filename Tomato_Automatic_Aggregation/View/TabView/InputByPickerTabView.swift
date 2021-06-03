//
//  InputByKeyboardTabView.swift
//  Tomato_Automatic_Aggregation
//
//  Created by TeraJun on 2021/05/29.
//

import SwiftUI

struct InputByPickerTabView: View {
    // 共有オブジェクト
    @EnvironmentObject var InputData: Variety
    // 品種IDと品種名の関連付け
    struct VarietiesDataBase: Codable {
        var id: String
        var name: String
    }
    let Varieties: [VarietiesDataBase] = Bundle.main.decodeJSON("varieties.json")
    
    var body: some View {
//        List(Varieties) { Variety in
//            Button("\(Variety.name)"){
//                InputData.InputVarietyID = Variety.id
//                InputData.InputVarietyName = Variety.name
//            }
//        }
        Text("Hello World!")
    }
}

struct InputByPickerTabView_Previews: PreviewProvider {
    static var previews: some View {
        InputByPickerTabView()
            .environmentObject(Variety())
    }
}
