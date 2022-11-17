//
//  ContentView.swift
//  Courses
//
//  Created by TrungVo_Diag on 08/11/2022.
//

import SwiftUI

enum BottomStateE {
    case full
    case mid
    case dismiss
}

struct ContentView: View {
    @State var show = false
    @State var viewState: CGSize = .zero
    @State var showCard = false
    @State var bottomState: CGSize = .zero

    var body: some View {
        ZStack {
            TitleView()
                .padding(.horizontal)
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
                    , value: [show, showCard])
            BackCardView(color: show ? .card3 : .card4)
                .frame(width: showCard ? 300 : 340, height: 220)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(y: showCard ? -180 : 0)
                .offset(x: viewState.width,
                        y: viewState.height)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 10), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5),
                           value: [show, showCard])
            BackCardView(color: show ? .card4 : .card3)
                .frame(width: 340, height: 220)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width,
                        y: viewState.height)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(.degrees(showCard ? -5 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 5), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3),
                           value: [show, showCard])
            CardView()
                .frame(width: showCard ? .infinity : 340,
                       height: 220)
                .background(Color.black)
                .cornerRadius(showCard ? 30 : 20)
                .shadow(radius: 20)
                .offset(y: showCard ? -100 : 0)
                .offset(x: viewState.width,
                        y: viewState.height)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3,
                                   dampingFraction: 0.6),
                           value: viewState)
                .animation(.spring(response: 0.3,
                                   dampingFraction: 0.6),
                           value: showCard)
                .onTapGesture {
                    self.showCard.toggle()
                }
                .gesture (
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                        self.show = true
                    }.onEnded { _ in
                        self.viewState = .zero
                        self.show = false
                    }
                )

            BottomCardView()
                .offset(y: showCard ? 500 : 2000)
                .offset(y: self.bottomState.height)
                .blur(radius: show ? 20 : 0)
                .animation(.default,
                           value: show)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8),
                           value: showCard)
                .gesture (
                    DragGesture().onChanged { value in
                        self.bottomState = value.translation
                    }.onEnded { _ in

                        if self.bottomState.height > 50 {
                            self.showCard = false
                        } else if self.bottomState.height < -100 {
                            self.bottomState.height = -300
                        } else {
                            self.bottomState = .zero
                        }
                    }
                )
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8),
                           value: bottomState)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Certificates")
                        .font(.subheadline)
                        .foregroundColor(.accent)
                }
                Spacer()
                Image.logo1
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image.card1
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
}

struct BackCardView: View {
    var color: Color
    var body: some View {
        color
            .cornerRadius(20)
            .shadow(radius: 20)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            Image.background1
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Desgn+Code instructor")
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.subheadline)
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
