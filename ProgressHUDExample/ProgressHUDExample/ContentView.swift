//
//  ContentView.swift
//  ProgressHUDExample
//
//  Created by Leo Ho on 2022/8/27.
//

import SwiftUI
import ProgressHUD

struct ContentView: View {
    
    @State var progress: CGFloat = 0
    
    var body: some View {
        VStack {
            Button {
                ProgressHUD.show()
            } label: {
                Text("Show")
                    .frame(width: 150, height: 50)
            }
            .background(.blue)
            .cornerRadius(25)
            .foregroundColor(.white)
            .padding()

            Button {
                ProgressHUD.showAdded()
            } label: {
                Text("Show Added")
                    .frame(width: 150, height: 50)
            }
            .background(.blue)
            .cornerRadius(25)
            .foregroundColor(.white)
            .padding()

            Button {
                ProgressHUD.showError()
            } label: {
                Text("Show Error")
                    .frame(width: 150, height: 50)
            }
            .background(.blue)
            .cornerRadius(25)
            .foregroundColor(.white)
            .padding()
            
            Button {
                ProgressHUD.showFailed()
            } label: {
                Text("Show Failed")
                    .frame(width: 150, height: 50)
            }
            .background(.blue)
            .cornerRadius(25)
            .foregroundColor(.white)
            .padding()
            
            Button {
                ProgressHUD.showSuccess()
            } label: {
                Text("Show Success")
                    .frame(width: 150, height: 50)
            }
            .background(.blue)
            .cornerRadius(25)
            .foregroundColor(.white)
            .padding()
                        
            Button {
                ProgressHUD.showSucceed()
            } label: {
                Text("Show Succeed")
                    .frame(width: 150, height: 50)
            }
            .background(.blue)
            .cornerRadius(25)
            .foregroundColor(.white)
            .padding()
            
            Button {
                ProgressHUD.showProgress("Process...", progress/100)
                progress += 10
                if progress >= 100 {
                    progress = 100
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    ProgressHUD.dismiss()
                }
            } label: {
                Text("Show Progress...")
                    .frame(width: 150, height: 50)
            }
            .background(.blue)
            .cornerRadius(25)
            .foregroundColor(.white)
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
