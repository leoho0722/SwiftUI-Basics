//
//  ContentView.swift
//  Palette SwiftUI
//
//  Created by Leo Ho on 2022/4/24.
//

import SwiftUI

struct ContentView: View {
    
    /// 紅色輸入框，redTextField 設為 @State，由 SwiftUI Memory 來管理狀態
    /// 滑動完 redSlider、redTextField 輸入完數值，會更新數值
    @State private var redTextField: String = ""
    
    /// 紅色滑桿，redSlider 設為 @State，由 SwiftUI Memory 來管理狀態
    /// 滑動完 redSlider、redTextField 輸入完數值，會更新數值
    @State private var redSlider: Double = 0
    
    /// 綠色輸入框，greenTextField 設為 @State，由 SwiftUI Memory 來管理狀態
    /// 滑動完 greenSlider、greenTextField 輸入完數值，會更新數值
    @State private var greenTextField: String = ""
    
    /// 綠色滑桿，greenSlider 設為 @State，由 SwiftUI Memory 來管理狀態
    /// 滑動完 greenSlider、greenTextField 輸入完數值，會更新數值
    @State private var greenSlider: Double = 0
    
    /// 藍色輸入框，blueTextField 設為 @State，由 SwiftUI Memory 來管理狀態
    /// 滑動完 blueSlider、blueTextField 輸入完數值，會更新數值
    @State private var blueTextField: String = ""
    
    /// 藍色滑桿，blueSlider 設為 @State，由 SwiftUI Memory 來管理狀態
    /// 滑動完 blueSlider、blueTextField 輸入完數值，會更新數值
    @State private var blueSlider: Double = 0
    
    /// 透明度輸入框，alphaTextField 設為 @State，由 SwiftUI Memory 來管理狀態
    /// 滑動完 alphaSlider、alphaTextField 輸入完數值，會更新數值
    @State private var alphaTextField: Double = 1
    
    /// 透明度滑桿，alphaSlider 設為 @State，由 SwiftUI Memory 來管理狀態
    /// 滑動完 alphaSlider、alphaTextField 輸入完數值，會更新數值
    @State private var alphaSlider: Double = 1
    
    /// 是否為首次滑動
    @State private var isFirst: Bool = true
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Palette")
                .foregroundColor(Color(red: redSlider/255, green: greenSlider/255, blue: blueSlider/255, opacity: alphaSlider))
                .font(.system(size: 32, weight: .bold))
                .padding()
            
            PaletteView(redValue: $redSlider,
                        greenValue: $greenSlider,
                        blueValue: $blueSlider,
                        alphaValue: $alphaSlider,
                        isFirst: $isFirst)
                .padding()
            
            ScrollView {
                ColorTextFieldSliderView(colorName: "Red",
                                         textFieldValue: $redTextField,
                                         sliderValue: $redSlider,
                                         isFirst: $isFirst,
                                         isRed: true,
                                         isGreen: false,
                                         isBlue: false)
                .padding(.bottom, 20)
                
                ColorTextFieldSliderView(colorName: "Green",
                                         textFieldValue: $greenTextField,
                                         sliderValue: $greenSlider,
                                         isFirst: $isFirst,
                                         isRed: false,
                                         isGreen: true,
                                         isBlue: false)
                .padding(.bottom, 20)
                
                ColorTextFieldSliderView(colorName: "Blue",
                                         textFieldValue: $blueTextField,
                                         sliderValue: $blueSlider,
                                         isFirst: $isFirst,
                                         isRed: false,
                                         isGreen: false,
                                         isBlue: true)
                .padding(.bottom, 20)
                
                AlphaTextFieldSliderView(colorName: "Alpha",
                                         textFieldValue: $alphaTextField,
                                         sliderValue: $alphaSlider,
                                         isFirst: $isFirst)
                .padding(.bottom, 20)
            }
            
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
