//
//  SecondPageView.swift
//  Cyber Ed
//
//  Created by Kristina on 2024-06-09.
//

import SwiftUI

struct SecondPageView: View {
    @State private var selectedOption: String? = nil

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 6.0) {
                Spacer()
                Text("I'm...")
                    .font(.title)
                    .padding()

                VStack(spacing: 20) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            selectedOption = option
                        }) {
                            Text(option)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedOption == option ? Color.black : Color.clear)
                                .foregroundColor(selectedOption == option ? Color.white : Color.primary)
                                .cornerRadius(8)
                        }
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 2)
                )

                Spacer()

                if let selectedOption = selectedOption {
                    switch selectedOption {
                    case "Pivoting into the Field":
                        NavigationLink(destination: PivotingFieldView()) {
                            Text("Next")
                                .padding()
                                .background(Color.black)
                                .foregroundColor(Color.white)
                                .cornerRadius(8)
                        }
                    case "Cyber Intermediate":
                        NavigationLink(destination: CyberIntermediateView()) {
                            Text("Next")
                                .padding()
                                .background(Color.black)
                                .foregroundColor(Color.white)
                                .cornerRadius(8)
                        }
                    case "Cyber Advanced":
                        NavigationLink(destination: CyberAdvancedView()) {
                            Text("Next")
                                .padding()
                                .background(Color.black)
                                .foregroundColor(Color.white)
                                .cornerRadius(8)
                        }
                    case "Cyber Executive":
                        NavigationLink(destination: CyberExecutiveView()) {
                            Text("Next")
                                .padding()
                                .background(Color.black)
                                .foregroundColor(Color.white)
                                .cornerRadius(8)
                        }
                    default:
                        EmptyView()
                    }
                }

                Spacer()
            }
            .padding([.top, .leading, .bottom], 17.0)
            .navigationBarTitle("Your level in Cyber")
        }
    }

    let options = [
        "Pivoting into the Field",
        "Cyber Intermediate",
        "Cyber Advanced",
        "Cyber Executive"
    ]
}

struct SecondPageView_Previews: PreviewProvider {
    static var previews: some View {
        SecondPageView()
    }
}
