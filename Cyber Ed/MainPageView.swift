//
//  MainPageView.swift
//  Cyber Ed
//
//  Created by Kristina on 2024-06-09.
//

import SwiftUI

struct MainPageView: View {
    @State private var showText = false
    @State private var isBouncing = false
    @State private var navigateToScreen2 = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Text("Your best cyber resource")
                        .font(.system(size: 17 * 1.5))
                        .foregroundColor(Color.white)
                        .padding(.top, 5)
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        ForEach(Array("Cyber Ed".enumerated()), id: \.offset) { index, letter in
                            Text(String(letter))
                                .font(.system(size: 36 * 1.5))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .opacity(showText ? 1 : 0)
                                .animation(.easeInOut.delay(Double(index) * 0.3), value: showText)
                        }
                        
                        Text("Swipe Up")
                            .font(.system(size: 25))
                            .foregroundColor(Color.white.opacity(2.0)) //  white
                            .offset(y: 50) // Adjust the position as needed
                    }
                    .padding()
                    .onAppear {
                        showText = true
                    }
                    .offset(y: 144)
                    
                    Spacer()
                    
                    Image(systemName: "key.viewfinder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .offset(y: isBouncing ? -20 : 0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: isBouncing)
                        .onAppear {
                            isBouncing = true
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    Spacer()
                    
                    NavigationLink("Click here", destination: SecondPageView())
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                VStack {
                    Spacer()
                    Text("All rights reserved")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 25)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
