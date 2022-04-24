//
//  PaletteView.swift
//  Palette SwiftUI
//
//  Created by Leo Ho on 2022/4/24.
//

import SwiftUI

struct PaletteView: View {
    
    @Binding var redValue: Double // 紅色的值，redValue 設為 @Binding，由 Parent View 來給值
    
    @Binding var greenValue: Double // 綠色的值，greenValue 設為 @Binding，由 Parent View 來給值
    
    @Binding var blueValue: Double // 藍色的值，blueValue 設為 @Binding，由 Parent View 來給值
    
    @Binding var alphaValue: Double // 透明度的值，alphaValue 設為 @Binding，由 Parent View 來給值
    
    @Binding var isFirst: Bool // 是否為首次滑動，isFirst 設為 @Binding，由 Parent View 來給值
    
    var body: some View {
        Rectangle()
            .foregroundColor(isFirst ? .gray : Color(red: redValue/255, green: greenValue/255, blue: blueValue/255, opacity: alphaValue))
            .frame(width: 200, height: 200)
            .cornerRadius(50)
    }
}

//struct PaletteView_Previews: PreviewProvider {
//    static var previews: some View {
//        PaletteView()
//    }
//}
