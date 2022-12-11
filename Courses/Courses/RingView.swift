//
//  RingView.swift
//  Courses
//
//  Created by TrungVo_Diag on 10/12/2022.
//

import SwiftUI

struct RingView: View {
    var colors: [Color] =  [Color.red, Color.yellow]
    var size: CGSize = .init(width: 88, height: 88)
    var percent: CGFloat = 50
    private let defaultWidth: CGFloat = 44
    var multiplier: CGFloat {
        size.width / defaultWidth
    }

    var progress: CGFloat {
        1 - (percent / 100)
    }

    @Binding var show: Bool

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: size.width,
                       height: size.height)

            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(
                    LinearGradient(colors: colors,
                                   startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0))
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: size.width,
                       height: size.height)
                .shadow(color: Color.red.opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)

            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
                .onTapGesture {
                    self.show.toggle()
                }
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
