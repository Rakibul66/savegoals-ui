import SwiftUI

struct ContentView: View {
    @State private var showModal = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Top Section with consistent background color
            VStack(alignment: .leading, spacing: 5) {
                Text("Super Saver")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Save your goals and daily plan")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding()
            .background(AppColors.background) // Apply background color here

            // Horizontal Scrollable Cards Section
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    // Left Card with black icon "+"
                    VStack {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.black)
                            .padding()
                            .onTapGesture {
                                showModal.toggle() // Show modal on tap
                            }
                    }
                    .frame(width: 64, height: 184)
                    .background(AppColors.container)
                    .cornerRadius(10)
                    
                    // Repeat Notebook Card for Horizontal Scrolling
                    ForEach(0..<3) { _ in
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Notebook")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            
                            Text("R$ 1.342,57")
                                .font(.body)
                                .foregroundColor(.white)
                            
                            Text("de R$ 5.000,00")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(AppColors.cardStroke)
                                    .frame(height: 10)
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(AppColors.container)
                                    .frame(width: 0.27 * 148, height: 10) // 27% fill
                            }
                            
                            HStack {
                                Spacer()
                                Text("27%")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(width: 148, height: 164)
                        .padding()
                        .background(AppColors.card)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }

            Text("Transactions")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.leading)

            VStack(spacing: 10) {
                HStack {
                    Text("+ R$ 334,30")
                        .foregroundColor(Color(hex: "#29E0A9"))
                    Spacer()
                    Text("16/03/2024")
                        .foregroundColor(Color(hex: "#7C7C8A"))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(AppColors.card)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(AppColors.stroke, lineWidth: 1)
                )
                
                HStack {
                    Text("- R$ 34,30")
                        .foregroundColor(Color(hex: "#FE6E78"))
                    Spacer()
                    Text("16/03/2024")
                        .foregroundColor(Color(hex: "#7C7C8A"))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(AppColors.card)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(AppColors.stroke, lineWidth: 1)
                )
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.background)
        .edgesIgnoringSafeArea(.bottom) // Ensure the content stretches to the bottom
        .sheet(isPresented: $showModal) {
            ModalBottomSheet()
                .presentationDetents([.height(300)]) // Adjust the height if needed
                .transition(.move(edge: .bottom)) // Transition animation
        }
    }
}

#Preview {
    ContentView()
}
