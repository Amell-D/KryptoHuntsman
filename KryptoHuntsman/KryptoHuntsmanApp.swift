//
//  KryptoHuntsmanApp.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/21/22.
//

import SwiftUI

@main
struct KryptoHuntsmanApp: App {

    @StateObject private var viewModel = HomeViewModel(networkingManager: NetworkingManager())
    private let quickActionService = QuickActionService()

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) var scenePhase

    @State private var showLaunchView: Bool = true

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
        UITableView.appearance().backgroundColor = UIColor.clear
    }

    var body: some Scene {
        WindowGroup {

            ZStack {
                NavigationView {
                    HomeView()
                        .navigationBarHidden(true)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .environmentObject(quickActionService)
                .environmentObject(viewModel)
                .onChange(of: scenePhase) { scenePhase in
                    switch scenePhase {
                        case .active:
                            guard let shortcutItem = appDelegate.shortcutItem else { return }
                            quickActionService.action = QuickAction(rawValue: shortcutItem.type)
                        case .background:
                            addDynamicQuickActions()
                        default: return
                    }
                }

                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0) // workaround for tricky transition

            }
        }
    }
}

extension KryptoHuntsmanApp {

    private func addDynamicQuickActions() {
        UIApplication.shared.shortcutItems = [
            UIApplicationShortcutItem(
                type: QuickAction.protfolio.rawValue,
                localizedTitle: "Your porfolio value",
                localizedSubtitle: UserDefaults.standard.double(forKey: "currentPortfolioValue").asCurrencyWith2Decimals(),
                icon: UIApplicationShortcutIcon(systemImageName: "bitcoinsign.circle"),
                userInfo: nil
            ),
            UIApplicationShortcutItem(
                type: QuickAction.about.rawValue,
                localizedTitle: "About the App",
                localizedSubtitle: nil,
                icon: UIApplicationShortcutIcon(systemImageName: "questionmark.circle"),
                userInfo: nil
            )
        ]
    }
}
