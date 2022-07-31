//
//  AboutView.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/24/22.
//

import SwiftUI

struct AboutView: View {

    @Environment(\.presentationMode) var presentationMode
    let defaultURL = URL(string: "https://www.google.com")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let youtubeURL = URL(string: "https://www.youtube.com/c/swiftfulthinking")!

    var body: some View {
        NavigationView {
            ZStack {

                // background
                Color.theme.background.ignoresSafeArea()

                // content
                List {
                    swiftfulThinkingSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    coingeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    appSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }

            }
            .font(.headline)
            .accentColor(Color.theme.accent)

            .navigationTitle("About App")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                    })
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

extension AboutView {

    private var swiftfulThinkingSection : some View {
        Section(header: Text("Swiftful Thinking")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made with companion of @SwiftfulThinking Cource on YouTube and with my own tweaks to it. Like more clean code, testing, theme changes, CI/CD processes etc. It uses MVVM Architecture, Combine and CoreData.")
                    .font(.callout)
                    .fontWeight(.medium)
            }
            .padding(.vertical)
            Link("Subscribe SwiftfulThinking on YouTube 🥳", destination: youtubeURL)
        }
    }

    private var coingeckoSection : some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("""
                     The cryptocurrency data that is used in this app comes from a free API from CoinGecko!
                     Prices may vary or be little delayed.
                    """)
                    .font(.callout)
                    .fontWeight(.medium)
            }
            .padding(.vertical)
            Link("Visit CoinGecko 🦎", destination: coingeckoURL)
        }
    }

    private var appSection : some View {
        Section(header: Text("Application")) {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Website", destination: defaultURL)
            Link("Learn more", destination: defaultURL)
        }
    }

}
