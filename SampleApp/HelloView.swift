//
//  HelloView.swift
//  SampleApp
//
//  Created by maiyama18 on 2024/09/13
//  
//

import SwiftUI

struct HelloView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.orange)
            Text("Hello, world!")
        }
        .padding()
        .font(.largeTitle)
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView()
    }
}
