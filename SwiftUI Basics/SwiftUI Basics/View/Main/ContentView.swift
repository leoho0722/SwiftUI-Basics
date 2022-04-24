//
//  ContentView.swift
//  SwiftUI Basics
//
//  Created by Leo Ho on 2022/4/24.
//

import SwiftUI

struct ContentView: View {
    
    var cityName: String = "Taipei"
    
    /// 星期幾 (全名)，weekday 設為 @State，由 SwiftUI Memory 來管理狀態
    /// 點擊 WeatherOfWeekView 時，會更新星期名稱
    @State private var weekday: Week_FullName = .Mon
    
    /// 天氣的 icon，imageName 設為 @State，由 SwiftUI Memory 來管理狀態
    /// 點擊 WeatherOfWeekView 時，會更新天氣 icon
    @State private var imageName: WeatherIconName = .sun_max_fill
    
    /// 溫度，temperature 設為 @State，由 SwiftUI Memory 來管理狀態
    /// 點擊 WeatherOfWeekView 時，會更新溫度
    @State private var temperature: Int = 30
    
    
    /// 判斷是否有點擊按鈕，手動切換成深色模式，isDarkMode 設為 @State，由 SwiftUI Memory 來管理狀態
    /// 點擊 ChangeNightModeButtonView 時，會更新狀態
    @State private var isDarkMode: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView(startPoint: .topLeading,
                           endPoint: .bottomTrailing,
                           startPointColor: .blue,
                           endPointColor: .white,
                           isDarkMode: $isDarkMode)
            
            VStack {
                Spacer()
                
                CityNameView(cityName: cityName)
                
                Spacer()
                
                WeatherInfoView(weekday: weekday, imageName: imageName, temperature: temperature)
                
                Spacer()
                
                ScrollView(.horizontal) {
                    HStack {
                        WeatherOfWeekView(weekday: .Mon, imageName: .sun_max_fill, temperature: 30)
                            .onTapGesture {
                                weekday = .Mon
                                imageName = .sun_max_fill
                                temperature = 30
                            }
                        
                        WeatherOfWeekView(weekday: .Tue, imageName: .cloud_fill, temperature: 25)
                            .onTapGesture {
                                weekday = .Tue
                                imageName = .cloud_fill
                                temperature = 25
                            }
                        
                        WeatherOfWeekView(weekday: .Wed, imageName: .cloud_rain_fill, temperature: 20)
                            .onTapGesture {
                                weekday = .Wed
                                imageName = .cloud_rain_fill
                                temperature = 20
                            }
                        
                        WeatherOfWeekView(weekday: .Thurs, imageName: .cloud_bolt_fill, temperature: 21)
                            .onTapGesture {
                                weekday = .Thurs
                                imageName = .cloud_bolt_fill
                                temperature = 21
                            }
                        
                        WeatherOfWeekView(weekday: .Fri, imageName: .cloud_sun_rain_fill, temperature: 24)
                            .onTapGesture {
                                weekday = .Fri
                                imageName = .cloud_sun_rain_fill
                                temperature = 24
                            }
                        
                        WeatherOfWeekView(weekday: .Sat, imageName: .wind, temperature: 15)
                            .onTapGesture {
                                weekday = .Sat
                                imageName = .wind
                                temperature = 15
                            }
                        
                        WeatherOfWeekView(weekday: .Sun, imageName: .cloud_sun_fill, temperature: 23)
                            .onTapGesture {
                                weekday = .Sun
                                imageName = .cloud_sun_fill
                                temperature = 23
                            }
                    }
                }
                
                Spacer()
                
                Button {
                    isDarkMode.toggle()
                } label: {
                    ChangeNightModeButtonView(textColor: isDarkMode ? .blue : .white,
                                              backgroundColor: isDarkMode ? .white : .blue,
                                              isDarkMode: $isDarkMode)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
