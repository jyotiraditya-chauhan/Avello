//
//  ContentView.swift
//  Avello
//
//  Created by Aditya Chauhan on 17/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RoutingView {
            SplashView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Router())
}
