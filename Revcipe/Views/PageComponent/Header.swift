//
//  Header.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct Header: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: UIColor
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .rotationEffect(Angle(degrees: angle))
                .foregroundColor(
                Color(background))
        
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 25))
                    .foregroundColor(.white)
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 1.3, height: 270)
        .offset(y:-100)
        .padding(.all, 1)
    }
}

#Preview {
    Header(title: "Title", subtitle: "Subtitle", angle: 15, background: .red)
}
