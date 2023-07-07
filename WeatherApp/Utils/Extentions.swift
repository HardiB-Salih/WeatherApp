//
//  Extentions.swift
//  WeatherApp
//
//  Created by HardiB.Salih on 7/7/23.
//

import SwiftUI

enum NumericFormatSpecifier: String {
    case integer = "%.0f"
    case decimal1 = "%.1f"
    case decimal2 = "%.2f"
    case decimal3 = "%.3f"
    case decimal4 = "%.4f"
    case scientific = "%e"
    case hexadecimal = "%x"
    case octal = "%o"
    case binary = "%b"
}

extension Double {
    func roundDouble(format: NumericFormatSpecifier = .integer) -> String {
        return String(format: format.rawValue, self)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
