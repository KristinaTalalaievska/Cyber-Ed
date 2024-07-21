//
//  PivotingFieldView.swift
//  Cyber Ed
//
//  Created by Kristina on 2024-06-16.
//
import SwiftUI

struct PivotingFieldView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
Text ("Dear beginner,")
                    .font(.custom("Calibri", size: 20))
                        .bold()
                       .padding(.top,10)
                Text( "Welcome to your Cyber Ed! Your journey in the cyber field starts here. You are well-equipped and well-prepared to take your next step. Here, you will find a library of the best resources to ensure your success.")
                    .font(.custom( "Calibri", size: 16))
                    .padding()
                    .multilineTextAlignment(.center)
                    .frame(maxWidth:.infinity, alignment:.center)
                    .padding(.bottom, 15)
                Text("Let's get started!")
                    .font(.custom("Calibri", size:23))
                    .bold()
                    .padding(20)

                NavigationLink(destination: YoutubeChannelsView()) {
                    Text("YouTube Channels")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, horizontalPadding)
                }
                .padding()

                NavigationLink(destination: CertificationRecommendationsView()) {
                    Text("Certification and Recommendations")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, horizontalPadding)
                }
                .padding()

                NavigationLink(destination: OnlineLabsView()) {
                    Text("Online Labs")
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
            .navigationBarTitle("Pivoting into the Field")
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

struct YoutubeChannelsView: View {
    var body: some View {
        Text("YouTube Channels View")
            .navigationBarHidden(true) // Hide navigation bar
    }
}

struct CertificationRecommendationsView: View {
    var body: some View {
        Text("Certification Recommendations View")
            .navigationBarHidden(true) // Hide navigation bar
    }
}

struct OnlineLabsView: View {
    var body: some View {
        Text("Online Labs View")
            .navigationBarHidden(true) // Hide navigation bar
    }
}

struct PivotingFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PivotingFieldView()
    }
}
