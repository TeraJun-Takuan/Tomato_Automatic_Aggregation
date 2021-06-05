//
//  InputByKeyboardTabView.swift
//  Tomato_Automatic_Aggregation
//
//  Created by TeraJun on 2021/05/29.
//

import SwiftUI
import Combine



struct InputByListTabView: View {
    // 共有オブジェクト
    @EnvironmentObject var InputData: Variety
    // Pickerで選択された品種
    @State var selectedVariety: Int? = nil
    // 品種IDと品種名の関連付け
    struct VarietiesDataBase: Codable {
        var id: String
        var name: String
    }
    let Varieties: [VarietiesDataBase] = Bundle.main.decodeJSON("varieties.json")
    var body: some View {
        VStack{
            GroupBox(label: Text("選択された品種：\(InputData.InputVarietyName)")) {
                List(selection: $selectedVariety) {
                    ForEach(0..<Varieties.count) { num in
                        Text("\(Varieties[num].id) \(Varieties[num].name)")
                    }
                }.environment(\.editMode, .constant(.active))
                .onDisappear {
                    if (selectedVariety != nil) {
                        InputData.InputVarietyID = Varieties[selectedVariety!].id
                        InputData.InputVarietyName = Varieties[selectedVariety!].name
                    }
                }
                
            }
        }
    }
}

struct InputByListTabView_Previews: PreviewProvider {
    static var previews: some View {
        InputByListTabView()
            .environmentObject(Variety())
    }
}
