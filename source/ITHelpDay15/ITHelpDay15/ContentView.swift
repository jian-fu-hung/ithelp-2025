///**
/**

ITHelpDay15
Created by:  Jerry  on 2025/9/30
Copyright (c) 2017 My Company

*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ImplicitAnimationExample: View {
    @State private var isBig = false

    var body: some View {
        VStack {
            Circle()
                .fill(Color.blue)
                .frame(width: isBig ? 200 : 100, height: isBig ? 200 : 100)
                .animation(.easeInOut, value: isBig)

            Button("切換大小") {
                isBig.toggle()
            }
        }
    }
}

struct Implicit2AnimationExample: View {
    @State private var moveRight = false

        var body: some View {
            VStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .offset(x: moveRight ? 150 : -150)
                    .animation(.linear, value: moveRight)
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .offset(x: moveRight ? 150 : -150)
                    .animation(.easeInOut, value: moveRight)
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .offset(x: moveRight ? 150 : -150)
                    .animation(.easeOut, value: moveRight)
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .offset(x: moveRight ? 150 : -150)
                    .animation(.easeIn, value: moveRight)
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .offset(x: moveRight ? 150 : -150)
                    .animation(.spring, value: moveRight)

                Button("切換位置") {
                    moveRight.toggle()
                }
                .padding(.top, 50)
            }
        }
}


struct ExplicitAnimationExample: View {
    @State private var isRotated = false

    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.green)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(isRotated ? 180 : 0))
            
            Button("旋轉") {
                withAnimation(.spring()) {
                    isRotated.toggle()
                }
            }
        }
    }
}


struct TransitionExample: View {
    @State private var showBox = false

    var body: some View {
        VStack {
            if showBox {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.slide) // 過渡動畫
            }

            Button("切換顯示") {
                withAnimation(.easeInOut) {
                    showBox.toggle()
                }
            }
        }
    }
}


struct LoopAnimationExample : View {
    @State private var isRotated = false
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.green)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(isRotated ? 360 : 0))
                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: isRotated)
            
        }
        .onAppear {
            isRotated = true
        }
    }
}

struct DelayAnimationExample : View {
    @State private var isRotated = true
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.green)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(isRotated ? 360 : 0))
                .animation(.easeInOut.delay(1), value: isRotated)
            Button("旋轉") {
                withAnimation(.spring()) {
                    isRotated.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

#Preview {
    ImplicitAnimationExample()
}

#Preview {
    Implicit2AnimationExample()
}

#Preview {
    ExplicitAnimationExample()
}

#Preview {
    TransitionExample()
}

#Preview {
    LoopAnimationExample()
}

#Preview {
    DelayAnimationExample()
}
