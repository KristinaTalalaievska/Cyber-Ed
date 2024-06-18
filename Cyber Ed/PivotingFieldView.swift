//
//  PivotingFieldView.swift
//  Cyber Ed
//
//  Created by Kristina on 2024-06-16.
//
import SwiftUI

struct PivotingFieldView: View {
    @State private var showText = false

    var body: some View {
        VStack {
            Text("Welcome to your cyber world")
                .font(.title)
                .padding()
                .opacity(showText ? 1 : 0) // Initially hidden
                .onChange(of: showText) { _ in
                    withAnimation {
                        self.showText = true // Fade in animation
                    }
                }

            NavigationLink(destination: YoutubeChannelsView()) {
                Text("YouTube Channels")
                    .padding()
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
            }
            .padding()

            NavigationLink(destination: CertificationRecommendationsView()) {
                Text("Certification and Recommendations")
                    .padding()
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
            }
            .padding()

            NavigationLink(destination: OnlineLabsView()) {
                Text("Online Labs")
                    .padding()
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle("Pivoting into the field")
    }
}

struct YoutubeChannelsView: View {
    var body: some View {
        Text("Youtube Channels View")
            .navigationBarTitle("Youtube Channels")
    }
}

struct CertificationRecommendationsView: View {
    var body: some View {
        Text("Certification Recommendations View")
            .navigationBarTitle("Certification and Recommendations")
    }
}

struct OnlineLabsView: View {
    var body: some View {
        Text("Online Labs View")
            .navigationBarTitle("Online Labs")
    }
}

struct PivotingFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PivotingFieldView()
    }
}
