import SwiftUI

struct ModalBottomSheet: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack {
                Text("Enter Goal")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Close the modal
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            VStack(spacing: 20) {
                TextField("Goal Title", text: .constant(""))
                    .padding()
                    .background(Color(hex: "#1A1A1A"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "#4B4B4B"), lineWidth: 1)
                    )
                
                TextField("Goal Amount", text: .constant(""))
                    .padding()
                    .background(Color(hex: "#1A1A1A"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "#4B4B4B"), lineWidth: 1)
                    )
            }
            .padding(.horizontal)
            
            Button(action: {
                // Save action here
            }) {
                Text("Save")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .background(Color(hex: "#2D2D2D"))
                    .cornerRadius(10)
            }
            .padding()
            .padding(.bottom, 20)
        }
        .background(Color(hex: "#1F1F1F"))
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .shadow(radius: 10)
        .presentationDetents([.height(300)]) // Customize height or use .large to fit content
    }
}
