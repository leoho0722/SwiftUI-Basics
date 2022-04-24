//
//  AlphaTextFieldSliderView.swift
//  Palette SwiftUI
//
//  Created by Leo Ho on 2022/4/24.
//

import SwiftUI

struct AlphaTextFieldSliderView: View {
    
    var colorName: String // 對應的顏色滑桿名稱
    
    @Binding var textFieldValue: Double // 對應的顏色輸入框的值，textFieldValue 設為 @Binding，由 Parent View 來給值
    
    @Binding var sliderValue: Double // 對應的顏色滑桿的值，sliderValue 設為 @Binding，由 Parent View 來給值
    
    @Binding var isFirst: Bool // 是否為首次滑動，isFirst 設為 @Binding，由 Parent View 來給值
    
    /// 是否顯示 Alert，isShowAlert 設為 @State，由 SwiftUI Memory 來管理狀態
    /// 當輸入超出範圍的值時，會進行更新
    @State private var isShowAlert: Bool = false
    
    var body: some View {
        HStack {
            if #available(iOS 15.0, *) {
                TextField(colorName, value: $textFieldValue, format: .number)
                    .padding(.leading)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                    .keyboardType(.default)
                    .onChange(of: textFieldValue, perform: { newValue in
                        guard newValue <= 1 && newValue >= 0 else {
                            isShowAlert = true
                            return
                        }
                    })
                    .onSubmit {
                        isFirst = false
                        sliderValue = textFieldValue
                    }
                    .alert("請輸入 0~1 之間的數值", isPresented: $isShowAlert) {
                        Button {
                            isShowAlert = false
                            textFieldValue = 0
                            sliderValue = 0
                        } label: {
                            Text("Close")
                        }
                    }
                
                Slider(value: $sliderValue, in: 0...1, step: 0.1) {
                    
                } minimumValueLabel: {
                    Text("\(0)")
                } maximumValueLabel: {
                    Text("\(1)")
                } onEditingChanged: { isChanged in
                    isFirst = false
                    textFieldValue = sliderValue
                }
                .padding(.trailing)
            } else {
                
            }
        }
    }
}

//struct AlphaTextFieldSliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlphaTextFieldSliderView()
//    }
//}
