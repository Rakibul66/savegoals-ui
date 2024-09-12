import SwiftUI

struct AppColors {
    static let background = Color(hex: "#0E0F11") // Background color
    static let stroke = Color(hex: "#0E0F11") // Stroke color (same as background)
    static let container = Color(hex: "#29E0A9") // Container color
    static let button = Color(hex: "#4551E6") // Button color
    static let card = Color(hex: "#16181A") // Card color
    static let cardStroke = Color(hex: "#202224") // Card stroke color
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = hex.hasPrefix("#") ? 1 : 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}
