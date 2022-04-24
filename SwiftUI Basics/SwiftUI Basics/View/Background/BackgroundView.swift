//
//  BackgroundView.swift
//  SwiftUI Basics
//
//  Created by Leo Ho on 2022/4/24.
//

import SwiftUI

struct BackgroundView: View {
    
    var startPoint: UnitPoint // 漸層起點
    
    var endPoint: UnitPoint // 漸層終點
    
    var startPointColor: Color // 白天時漸層起點的顏色
    
    var endPointColor: Color // 白天時漸層終點的顏色
    
    @Binding var isDarkMode: Bool // 判斷是否有點擊按鈕，手動切換成深色模式，isDarkMode 設為 @Binding，由 Parent View 來給值
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isDarkMode ? .black : startPointColor, isDarkMode ? .gray : endPointColor]),
                       startPoint: startPoint, endPoint: endPoint)
        .edgesIgnoringSafeArea(.all) // 讓邊界忽略 SafeArea
    }
}

//struct BackgroundView_Previews: PreviewProvider {
//    static var previews: some View {
//        BackgroundView(startPoint: .topLeading, endPoint: .bottomTrailing,
//                       startPointColor: .blue, endPointColor: .white)
//    }
//}
