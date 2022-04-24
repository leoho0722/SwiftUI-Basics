//
//  ChangeNightModeButtonView.swift
//  SwiftUI Basics
//
//  Created by Leo Ho on 2022/4/24.
//

import SwiftUI

struct ChangeNightModeButtonView: View {
    
    var textColor: Color // 文字的顏色
    
    var backgroundColor: Color // 背景色
    
    @Binding var isDarkMode: Bool // 判斷是否有點擊按鈕，手動切換成深色模式，isDarkMode 設為 @Binding，由 Parent View 來給值
    
    var body: some View {
        HStack {
            Image(systemName: isDarkMode ? "sun.max.circle.fill" : "moon.circle.fill")
                .resizable()
                .renderingMode(.original)
                .frame(width: 30, height: 30)
                .aspectRatio(contentMode: .fit)
            
            Text(isDarkMode ? "Change to Light Mode" : "Change to Dark Mode")
            
        }
        .frame(width: 280, height: 50)
        .font(.system(size: 20, weight: .bold))
        .background(backgroundColor)
        .foregroundColor(textColor)
        .cornerRadius(25)
        .padding()
    }
}

//struct ChangeNightModeButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChangeNightModeButtonView(textColor: .blue, backgroundColor: .white)
//    }
//}
