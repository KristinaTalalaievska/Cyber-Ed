//
//  TwoThreeInCyber.swift
//  Cyber Ed
//
//  Created by Kristina on 2024-06-16.
//

import SwiftUI

struct CyberIntermediateView: View {
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

                NavigationLink(destination: CertificationsView()) {
                    Text("Certifications")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, horizontalPadding)
                }
                .padding()

                NavigationLink(destination: HandsOnPracticeView()) {
                    Text("Hands-On Practice")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, horizontalPadding)
                }
                .padding()

                NavigationLink(destination: BooksView()) {
                    Text("Books")
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
            .navigationBarTitle("Cyber Intermediate")
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

struct CertificationsView: View {
    var body: some View {
        Text("Certifications View")
            .navigationBarHidden(true) // Hide navigation bar
    }
}

struct HandsOnPracticeView: View {
    var body: some View {
        Text("Hands-On Practice View")
            .navigationBarHidden(true) // Hide navigation bar
    }
}

struct BooksView: View {
    var body: some View {
        Text("Books View")
            .navigationBarHidden(true) // Hide navigation bar
    }
}

struct CyberIntermediateView_Previews: PreviewProvider {
    static var previews: some View {
        CyberIntermediateView()
    }
}
