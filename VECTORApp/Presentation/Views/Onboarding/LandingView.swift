import SwiftUI

struct LandingView: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            // Pure black background for OLED screens (Apple standard)
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        
                        // Main Title Area
                        VStack(alignment: .center, spacing: 8) {
                            Image(systemName: "location.north.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                                .foregroundStyle(.blue, .blue.opacity(0.3))
                                .padding(.bottom, 16)
                            
                            Text("Welcome to")
                                .font(.system(size: 34, weight: .bold, design: .default))
                                .foregroundColor(.white)
                            
                            Text("VECTOR")
                                .font(.system(size: 34, weight: .black, design: .default))
                                .foregroundColor(.blue)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 60)
                        .padding(.bottom, 50)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : 20)
                        
                        // Features List
                        VStack(alignment: .leading, spacing: 32) {
                            FeatureRow(
                                icon: "point.topleft.down.curvedto.point.bottomright.up",
                                iconColor: .blue,
                                title: "Predictive Routing",
                                description: "Intelligent decisions based on predicted future traffic, not just current conditions."
                            )
                            
                            FeatureRow(
                                icon: "slider.horizontal.3",
                                iconColor: .green,
                                title: "Multi-Objective Optimization",
                                description: "Balance travel time, toll costs, and CO₂ emissions tailored to your preferences."
                            )
                            
                            FeatureRow(
                                icon: "chart.bar.xaxis",
                                iconColor: .purple,
                                title: "Risk & Uncertainty",
                                description: "Know the probability of reaching your destination before your deadline."
                            )
                        }
                        .padding(.horizontal, 30)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : 20)
                        
                        // Bottom padding to ensure content isn't hidden behind the button
                        Spacer().frame(height: 120)
                    }
                }
            }
            
            // Bottom CTA Area (Apple's standard sticky bottom button)
            VStack {
                Spacer()
                
                VStack {
                    Button(action: {
                        // Action to enter
                        print("Enter System")
                    }) {
                        Text("Continue")
                            .font(.system(size: 17, weight: .semibold, design: .default))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.blue)
                            .cornerRadius(14)
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 34) // Safe area padding
                    .padding(.top, 20)
                }
                .background(
                    // Material blur effect for the bottom bar
                    Rectangle()
                        .fill(Color.black.opacity(0.8))
                        .background(.ultraThinMaterial)
                        .edgesIgnoringSafeArea(.bottom)
                )
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 20)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .onAppear {
            withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0)) {
                isAnimating = true
            }
        }
    }
}

// Reusable component for the feature list
struct FeatureRow: View {
    var icon: String
    var iconColor: Color
    var title: String
    var description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 32, weight: .regular))
                .foregroundColor(iconColor)
                .frame(width: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 17, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                
                Text(description)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(.gray)
                    .lineSpacing(2)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        LandingView()
            .preferredColorScheme(.dark)
    }
}
