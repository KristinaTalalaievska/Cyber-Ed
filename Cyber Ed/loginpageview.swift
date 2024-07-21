//
//  loginview.swift
//  Cyber Ed
//
//  Created by Kristina on 2024-07-15.
//
import SwiftUI

struct LoginPageView: View {
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var selectedCountry: String = ""
    @State private var acceptTerms: Bool = false
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    @State private var navigateToSecondPage: Bool = false
    
    // Mock data for countries
    let countries = Locale.isoRegionCodes.compactMap { regionCode in
            Locale.current.localizedString(forRegionCode: regionCode)
        }.sorted()
        

    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                TextField("Name", text: $name)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .autocapitalization(.words)
                
                TextField("Surname", text: $surname)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .autocapitalization(.words)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
               TextField("Phone Number", text: $phoneNumber)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .keyboardType(.phonePad)
                
              Picker("Country", selection: $selectedCountry) {
                    ForEach(countries, id: \.self) { country in
                        HStack {
                            Text(country)
                            Spacer()
                            Image(systemName: "flag")
                                .foregroundColor(.blue)
                        }
                        .tag(country)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .padding(.horizontal)
                
               Toggle(isOn: $acceptTerms) {
                                    Text("I accept the terms and conditions")
                                        .foregroundColor(Color.primary)
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 20)
                                
                                NavigationLink(destination: SecondPageView(), isActive: $navigateToSecondPage) {
                                    Button(action: {
                                        validateInputs()
                                    }) {
                                        Text("Sign in")
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(Color.black)
                                            .foregroundColor(Color.white)
                                            .cornerRadius(8)
                                            .padding(.horizontal)
                                    }
                                    .disabled(!acceptTerms)
                                    .alert(isPresented: $showAlert) {
                                        Alert(title: Text("Validation Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                                    }
                                }
                                
                                Spacer()
                            }
                            .modifier(NavigationBarTitleModifier(fontSize: 18)) // Adjust font size here
                            .navigationBarItems(trailing:
                                Image(systemName: "person.crop.circle.fill")
                                    .font(.title)
                                    .


                foregroundColor(.white)
                                    .padding()
                            )
                        }
                    }
                    
    private func validateInputs() {
            if name.isEmpty || surname.isEmpty {
                alertMessage = "Name and Surname cannot be empty."
                showAlert = true
                return
            }
            
            if !isValidEmail(email) {
                alertMessage = "Please enter a valid email address."
                showAlert = true
                return
            }
            
            if !isValidPhoneNumber(phoneNumber) {
                alertMessage = "Please enter a valid phone number."
                showAlert = true
                return
            }
            
            if selectedCountry.isEmpty {
                alertMessage = "Please select a country."
                showAlert = true
                return
            }
            
            // Proceed with login action if all validations pass
            navigateToSecondPage = true
        }
        
        private func isValidEmail(_ email: String) -> Bool {
            // Basic email validation using regex
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
        
        private func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
            // Basic phone number validation (digits only and reasonable length)
            let phoneRegEx = "^[0-9]{6,15}$"
            let phonePred = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
            return phonePred.evaluate(with: phoneNumber)
        }
    }
// Custom modifier to adjust Navigation Bar Title font size
struct NavigationBarTitleModifier: ViewModifier {
    var fontSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("Welcome to Your Cyber World", displayMode: .inline)
            .font(.system(size: fontSize, weight: .bold))
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
