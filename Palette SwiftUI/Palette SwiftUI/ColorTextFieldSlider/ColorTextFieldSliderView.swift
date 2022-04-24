//
//  ColorTextFieldSliderView.swift
//  Palette SwiftUI
//
//  Created by Leo Ho on 2022/4/24.
//

import SwiftUI

struct ColorTextFieldSliderView: View {
    
    var colorName: String // 對應的顏色滑桿名稱
    
    @Binding var textFieldValue: String // 對應的顏色輸入框的值，textFieldValue 設為 @Binding，由 Parent View 來給值
    
    @Binding var sliderValue: Double // 對應的顏色滑桿的值，sliderValue 設為 @Binding，由 Parent View 來給值
    
    @Binding var isFirst: Bool // 是否為首次滑動，isFirst 設為 @Binding，由 Parent View 來給值
    
    var isRed: Bool // 是否為紅色滑桿
    
    var isGreen: Bool // 是否為綠色滑桿
    
    var isBlue: Bool // 是否為藍色滑桿
    
    /// 是否顯示 Alert，isShowAlert 設為 @State，由 SwiftUI Memory 來管理狀態
    /// 當輸入超出範圍的值時，會進行更新
    @State private var isShowAlert: Bool = false
    
    var body: some View {
        HStack {
            if #available(iOS 15.0, *) {
                TextField(colorName, text: $textFieldValue)
                    .padding(.leading)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                    .keyboardType(.default)
                    .onChange(of: textFieldValue, perform: { newValue in
                        if let newValue = Double(newValue) {
                            guard newValue <= 255 && newValue >= 0 else {
                                isShowAlert = true
                                return
                            }
                        }
                    })
                    .onSubmit {
                        if let textFieldValue = Double(textFieldValue) {
                            isFirst = false
                            sliderValue = textFieldValue
                        } else {
                            sliderValue = 0
                        }
                    }
                    .alert("請輸入 0~255 之間的數值", isPresented: $isShowAlert) {
                        Button {
                            isShowAlert = false
                            textFieldValue = ""
                            sliderValue = 0
                        } label: {
                            Text("Close")
                        }
                    }

                Slider(value: $sliderValue, in: 0...255, step: 1) {
                    
                } minimumValueLabel: {
                    Text("\(0)")
                } maximumValueLabel: {
                    Text("\(255)")
                } onEditingChanged: { isChanged in
                    isFirst = false
                    textFieldValue = "\(sliderValue)"
                }
                .tint(Color(red: isRed ? sliderValue : 0, green: isGreen ? sliderValue : 0, blue: isBlue ? sliderValue : 0))
                .padding(.trailing)
            } else {
                
            }
        }
    }
}


//struct ColorTextFieldSliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorTextFieldSliderView()
//    }
//}
