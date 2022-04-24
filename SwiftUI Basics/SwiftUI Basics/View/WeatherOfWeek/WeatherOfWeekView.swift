//
//  WeatherOfWeekView.swift
//  SwiftUI Basics
//
//  Created by Leo Ho on 2022/4/24.
//

import SwiftUI

struct WeatherOfWeekView: View {
    
    var weekday: Week_ShortName // 星期幾 (縮寫)
    
    var imageName: WeatherIconName // 天氣的 icon
    
    var temperature: Int // 溫度
    
    var body: some View {
        VStack {
            Text(weekday.rawValue)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .medium))
                .bold()
            
            Image(systemName: imageName.rawValue)
                .resizable()
                .renderingMode(.original)
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            Text("\(temperature)ºC")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .medium))
                .bold()
        }.padding()
    }
}

//struct WeatherOfWeekView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherOfWeekView(weekday: .Mon, imageName: .sun_max_fill, temperature: 30)
//    }
//}
