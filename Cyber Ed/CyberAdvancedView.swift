//
//  CyberAdvancedView.swift
//  Cyber Ed
//
//  Created by Kristina on 2024-06-16.
//

import SwiftUI

struct CyberAdvancedView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                Text("Welcome to your cyber world")
                    .font(.title)
                    .padding()
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 25)

                NavigationLink(destination: ReportsView()) {
                    Text("Reports")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, horizontalPadding)
                }
                .padding()

                NavigationLink(destination: PodcastsView()) {
                    Text("Podcasts")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, horizontalPadding)
                }
                .padding()

                NavigationLink(destination: ArticlesView()) {
                    Text("Articles")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, horizontalPadding)
                }
                .padding()

                Spacer()
            }
            .navigationBarTitle("Cyber Advanced View")
            .navigationBarBackButtonHidden(true) // Hide default back button
            .navigationBarHidden(true) // Hide entire navigation bar
        }
        .navigationBarHidden(true) // Hide navigation bar for the entire view
    }
    
    private var horizontalPadding: CGFloat {
        if horizontalSizeClass == .compact {
            // Compact horizontal size class (e.g., iPhone in landscape)
            return 50
        } else {
            // Regular horizontal size class (e.g., iPhone in portrait)
            return 20
        }
    }
}

struct ReportsView: View {
    var body: some View {
        Text("Reports View")
            .navigationBarHidden(true) // Hide navigation bar
    }
}

struct PodcastsView: View {
    var body: some View {
        Text("Podcasts View")
            .navigationBarHidden(true) // Hide navigation bar
    }
}

struct ArticlesView: View {
    var body: some View {
        Text("Articles View")
            .navigationBarHidden(true) // Hide navigation bar
    }
}

struct CyberAdvancedView_Previews: PreviewProvider {
    static var previews: some View {
        CyberAdvancedView()
    }
}
