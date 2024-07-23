import SwiftUI

struct MainPageView: View {
    @State private var showText = false
    @State private var isBouncing = false
    @State private var navigateToScreen2 = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Your best cyber resource")
                        .font(.system(size: 17 * 1.5))
                        .foregroundColor(Color.white)
                        .padding(.top, 5)
                    Spacer()
                    VStack {
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
                                .foregroundColor(Color.white.opacity(0.5)) // White with opacity
                                .offset(y: 50) // Adjust the position as needed
                        }
                        .onAppear {
                            showText = true
                        }
                        VStack {
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
                                .frame(maxWidth: .infinity)
                            SwipeUpArrowView() // Add the animated arrow view
                        }
                    }
                    Spacer()
                }
                VStack {
                    Text("All rights reserved")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 25)
                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
        }
    }
}


struct SwipeUpArrowView: View {
    @State private var arrowOpacity: Double = 0.0
    @State private var arrowOffset: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Image(systemName: "arrow.up")
                .font(.largeTitle)
                .foregroundColor(Color.white.opacity(0.5)) // Half transparent white color
            //          .opacity(arrowOpacity)
//                .offset(y: arrowOffset)
            //                .onAppear {
            //                    withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
            //                        arrowOpacity = 1.0
            //                        arrowOffset = -20.0
            //                    }
            //                }
        }
    }
    struct MainPageView_Previews: PreviewProvider {
        static var previews: some View {
            MainPageView()
        }
    }
    
    struct secondPageView: View {
        var body: some View {
            Text("Second Page View")
        }
    }
}
