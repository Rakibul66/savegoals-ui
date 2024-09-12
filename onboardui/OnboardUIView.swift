//
//  OnboardUIView.swift
//  onboardui
//
//  Created by Roxy on 10/9/24.
//

import SwiftUI

struct OnboardUIView: View {
    @State private var isActive = false
    @State private var textAnimationState: [Bool] = [false, false, false, false, false] // Track the animation state for each word

    let splashDuration = 3.0 // Duration in seconds
    let animationDuration = 0.5 // Duration for each text animation

    var body: some View {
        if isActive {
            ContentView() // Navigate to ContentView after the delay
        } else {
            VStack {
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)
                    .padding(.bottom, 20)

                HStack(spacing: 0) {
                    AnimatedText(color: .white, isAnimating: $textAnimationState[0], text: "Welcome")
                                    AnimatedText(color: .yellow, isAnimating: $textAnimationState[1], text: "Save")
                    AnimatedText(color: .white, isAnimating: $textAnimationState[2], text: " your ")
                    AnimatedText(color: .red, isAnimating: $textAnimationState[3], text: "goals")
                }
                .font(.largeTitle)
                .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(AppColors.background) // Using background color from AppColors
            .onAppear {
                // Start animating each word with a delay
                for i in 0..<textAnimationState.count {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * animationDuration) {
                        withAnimation(.easeIn(duration: animationDuration)) {
                            textAnimationState[i] = true
                        }
                    }
                }

                // Start the timer to transition after the set duration
                DispatchQueue.main.asyncAfter(deadline: .now() + splashDuration) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

// Helper View for animating text
struct AnimatedText: View {
    var color: Color // Moved color before isAnimating
    @Binding var isAnimating: Bool
    var text: String

    var body: some View {
        Text(text)
            .foregroundColor(color)
            .opacity(isAnimating ? 1 : 0) // Fade-in animation
            .animation(.easeInOut, value: isAnimating)
    }
}

#Preview {
    OnboardUIView()
}
