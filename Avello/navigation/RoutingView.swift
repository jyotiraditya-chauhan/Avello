//
//  RoutingView.swift
//  Avello
//
//  Created by Aditya Chauhan on 02/03/26.
//

import Foundation
import SwiftUI
import Combine

struct RoutingView<Root: View>: View {
    @EnvironmentObject var router: Router
    let root: () -> Root
    
    init(@ViewBuilder root: @escaping () -> Root) {
        self.root = root
    }
    
    var body: some View {
        NavigationStack(path: $router.stack) {
            root()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .splash:
                        SplashView()
                    case .onboarding:
                        OnBoardingView()
                    case .auth:
                        LoginView()
                    case .assessment:
                        AssessmentView()
                    case .main:
                        MainTabView()
                    case .communityRooms:
                        CommunityRoomsView()
                    case .settings:
                        SettingsView()
                    }
            
                }
        }
    }
}
