//

import SwiftUI


extension CGFloat {
    
    static var screenWidth: Double {
        return UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: Double {
        return UIScreen.main.bounds.size.height
    }
    
    static func widthPer(per: Double) -> Double {
        return screenWidth * per
    }
    
    static func heightPer(per: Double) -> Double {
        return screenHeight * per
    }
    
    static var topInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.top
        }
        return 0.0
    }
    
    static var bottomInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.bottom
        }
        return 0.0
    }
    
    static var horizontalInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.left + keyWindow.safeAreaInsets.right
        }
        return 0.0
    }
    
    static var verticalInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.top + keyWindow.safeAreaInsets.bottom
        }
        return 0.0
    }
    
    
}
extension Color{
    init(hex: String) {
           let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
           var int: UInt64 = 0
           Scanner(string: hex).scanHexInt64(&int)
           let a, r, g, b: UInt64
           switch hex.count {
               case 3: // RGB(12 -bit)
                   (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
               case 6: // RGB (24-bit)
                   (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
               case 8: // ARGB (32-bit)
                   (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
               default:
                   (a, r, g, b) = (1, 1, 1, 0)
           }
           
           self.init(
               .sRGB,
               red: Double(r) / 255,
               green: Double(g) / 255,
               blue:  Double(b) / 255,
               opacity: Double(a) / 255
           )
       }
}

struct ShowButton : ViewModifier{
    @Binding var isShow : Bool
    
    public func body(content: Content) -> some View {
        HStack{
            content
            Button {
                isShow.toggle()
            } label: {
                Image(systemName: isShow ? "eye.fill" : "eye.slash.fill")
                    .foregroundColor(.black.opacity(0.7))
            }

        }
    }
}
extension View{
    func cornerRadius(_ radius : CGFloat , corner : UIRectCorner) -> some View{
        clipShape(RounderCorner(radius: radius, corner: corner))
    }
}
struct RounderCorner : Shape{
    var radius : CGFloat = .infinity
    var corner : UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


