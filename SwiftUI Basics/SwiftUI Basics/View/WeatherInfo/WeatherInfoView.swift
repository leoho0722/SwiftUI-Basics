//
//  WeatherInfoView.swift
//  SwiftUI Basics
//
//  Created by Leo Ho on 2022/4/24.
//

import SwiftUI

struct WeatherInfoView: View {
    
    var weekday: Week_FullName // 星期幾 (全名)
    
    var imageName: WeatherIconName // 天氣的 icon
    
    var temperature: Int // 溫度
    
    var body: some View {
        VStack {
            Text(weekday.rawValue)
                .foregroundColor(.white)
                .font(.system(size: 50, weight: .bold))
            
            Image(systemName: imageName.rawValue)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            Text("\(temperature)ºC")
                .foregroundColor(.white)
                .font(.system(size: 50, weight: .bold))
        }
    }
}

//struct WeatherInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherInfoView(weekday: .Mon, imageName: .sun_max_fill, temperature: 30)
//    }
//}
