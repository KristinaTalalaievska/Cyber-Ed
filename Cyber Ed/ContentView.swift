//
//  ContentView.swift
//  Cyber Ed
//
//  Created by Kristina on 2024-06-09.
//
import SwiftUI

struct ContentView: View {
    @State private var showText = false
    @State private var isBouncing = false
    @State private var navigateToScreen2 = false
    @State private var dragOffset: CGFloat = 0
    @State private var isDragging = false
    
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
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    withAnimation {
                                        dragOffset = value.translation.height
                                        isDragging = true
                                    }
                                }
                                .onEnded { value in
                                    withAnimation {
                                        if dragOffset < -100 {
                                            navigateToScreen2 = true
                                        }
                                        dragOffset = 0
                                        isDragging = false
                                    }
                                }
                        )
                    
                    Spacer()
                    
                    NavigationLink(destination: LoginPageView(), isActive: $navigateToScreen2) {
                        EmptyView()
                    }
                    .frame(width: 0, height: 0)
                    .hidden()
                    
                    Text("Swipe up to explore")
                        .foregroundColor(.white.opacity(isDragging ? 0 : 0.5)) // Translucent white
                        .padding()
                        .background(Color.black) // Black background
                        .cornerRadius(8)
                        .offset(y: isDragging ? -dragOffset : 0) // Position under lock icon
                        .opacity(isDragging ? 1 : 0)
                    
                    Spacer()
                    
                    Text("All rights reserved")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
            }
                        .navigationBarHidden(true)
                    }
                }
            }

            struct ContentView_Previews: PreviewProvider {
                static var previews: some View {
                    ContentView()
                }
            }
