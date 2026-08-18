import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            // Adaptive background (White in light mode, Black in dark mode)
            Color(UIColor.systemBackground).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 30) {
                
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Sign In")
                        .font(.system(size: 34, weight: .bold, design: .default))
                        .foregroundColor(.primary) // Adapts to theme
                    
                    Text("Access your predictive route intelligence.")
                        .font(.system(size: 17, weight: .regular, design: .default))
                        .foregroundColor(.secondary) // Adapts to theme
                }
                .padding(.top, 40)
                
                // Input Fields
                VStack(spacing: 16) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.secondary)
                            .frame(width: 20)
                        TextField("Email", text: $email)
                            .foregroundColor(.primary)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                    }
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)
                    
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.secondary)
                            .frame(width: 20)
                        SecureField("Password", text: $password)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)
                }
                
                // Forgot Password
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Text("Forgot Password?")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.blue)
                    }
                }
                
                Spacer()
                
                // Action Buttons
                VStack(spacing: 16) {
                    Button(action: {}) {
                        Text("Sign In")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white) // Always white on blue
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.blue)
                            .cornerRadius(14)
                    }
                    
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "applelogo")
                            Text("Sign in with Apple")
                        }
                        .font(.system(size: 17, weight: .semibold))
                        // Apple guidelines: black text on white bg (light theme), white text on black bg (dark theme) for the button.
                        // Or inverted. Let's use Apple's standard adaptive button styling:
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(colorScheme == .dark ? Color.white : Color.black)
                        .cornerRadius(14)
                    }
                }
                
                // Sign Up Link
                HStack {
                    Spacer()
                    Text("Don't have an account?")
                        .foregroundColor(.secondary)
                    Button(action: {}) {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                    Spacer()
                }
                .padding(.bottom, 20)
                
            }
            .padding(.horizontal, 24)
        }
    }
}
