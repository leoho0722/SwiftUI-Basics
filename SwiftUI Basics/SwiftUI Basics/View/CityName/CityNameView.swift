//
//  CityNameView.swift
//  SwiftUI Basics
//
//  Created by Leo Ho on 2022/4/24.
//

import SwiftUI

struct CityNameView: View {
    
    var cityName: String // 城市名稱
    
    var body: some View {
        Text(cityName)
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
            .padding()
    }
}

//struct CityNameView_Previews: PreviewProvider {
//    static var previews: some View {
//        CityNameView(cityName: "Taipei")
//    }
//}
