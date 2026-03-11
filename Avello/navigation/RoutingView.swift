//
//  RoutingView.swift
//  Avello
//
//  Created by Aditya Chauhan on 02/03/26.
//

import SwiftUI

struct RoutingView<Root: View>: View {
    @EnvironmentObject var router: Router
    let root: () -> Root
    
    init(@ViewBuilder root: @escaping () -> Root) {
        self.root = root
    }
    
    var body: some View {
        NavigationStack(path: $router.stack) {
            root()
                .transparentContainer()
                .navigationDestination(for: AppRoute.self) { route in
                    Group {
                        switch route {
                        case .splash:       SplashView()
                        case .onboarding:   OnBoardingView().navigationBarBackButtonHidden(true)
                        case .auth:         AuthView()
                        case .assessment:   AssessmentView()
                        case .main:         MainTabView()
                        case .communityRooms: CommunityRoomsView()
                        case .settings:     SettingsView()
                        }
                    }
                    .transparentContainer()
                }
        }
        .transparentNavigation()
    }
}
