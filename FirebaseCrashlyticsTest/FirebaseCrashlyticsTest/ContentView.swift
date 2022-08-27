//
//  ContentView.swift
//  FirebaseCrashlyticsTest
//
//  Created by Leo Ho on 2022/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Crash") {
            fatalError("Crash was triggered")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
