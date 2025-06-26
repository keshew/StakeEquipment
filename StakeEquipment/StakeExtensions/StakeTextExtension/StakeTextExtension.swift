import SwiftUI

extension Text {
    func Poppins(size: CGFloat,
                 color: Color = .white)  -> some View {
        self.font(.custom("Poppins-Regular", size: size))
            .foregroundColor(color)
    }
    
    func PoppinsBold(size: CGFloat,
            color: Color = .white)  -> some View {
        self.font(.custom("Poppins-Bold", size: size))
            .foregroundColor(color)
    }
}
