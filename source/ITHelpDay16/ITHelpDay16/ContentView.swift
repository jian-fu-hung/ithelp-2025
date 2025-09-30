///**
/**

ITHelpDay16
Created by:  Jerry  on 2025/10/1
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

struct CanvasExample: View {
    var body: some View {
        Canvas { context, size in
            // 繪製圓形
            let rect = CGRect(origin: .zero, size: size)
            context.fill(Path(ellipseIn: rect), with: .color(.blue))
            

            // 繪製文字
            context.draw(Text("Hello Canvas"), at: CGPoint(x: size.width/2, y: size.height/2))
        }
        .frame(width: 200, height: 200)
    }
}

struct CanvasPathExample: View {
    var body: some View {
        Canvas { context, size in
            // 繪製矩形
            let rect = CGRect(x: 20, y: 20, width: 100, height: 100)
            context.fill(Path(rect), with: .color(.blue))

            // 繪製圓形
            let circle = CGRect(x: 150, y: 20, width: 100, height: 100)
            context.stroke(Path(ellipseIn: circle), with: .color(.red), lineWidth: 4)
        }
        .frame(height: 150)
    }
}

struct CanvasTextExample: View {
    var body: some View {
        Canvas { context, size in
            let text = Text("Hello Canvas")
                .font(.title).foregroundColor(.purple)
            context.draw(text, at: CGPoint(x: size.width / 2, y: size.height / 2))
        }
        .frame(height: 100)
    }
}

struct CanvasImageExample: View {
    var body: some View {
        Canvas { context, size in
            let image = context.resolve(Image(systemName: "star.fill"))
            context.draw(image, at: CGPoint(x: size.width / 2, y: size.height / 2))
        }
        .frame(width: 150, height: 150)
    }
}

struct CanvasGradientExample: View {
    var body: some View {
        Canvas { context, size in
            let rect = CGRect(origin: .zero, size: size)
            let gradient = Gradient(colors: [.blue, .green, .yellow])
            context.fill(Path(ellipseIn: rect),
                         with: .linearGradient(gradient,
                                               startPoint: .zero,
                                               endPoint: CGPoint(x: size.width, y: size.height)))
        }
        .frame(width: 200, height: 200)
    }
}

struct CanvasTransformExample: View {
    var body: some View {
        Canvas { context, size in
            let center = CGPoint(x: size.width/2, y: size.height/2)

            for i in 0..<12 {
                var path = Path()
                path.move(to: center)
                path.addLine(to: CGPoint(x: center.x, y: center.y - 80))

                // 建立旋轉矩陣
                let angle = Angle.degrees(Double(i) * 30)
                let transform = CGAffineTransform(translationX: center.x, y: center.y)
                    .rotated(by: CGFloat(angle.radians))
                    .translatedBy(x: -center.x, y: -center.y)

                context.stroke(path.applying(transform), with: .color(.orange), lineWidth: 2)
            }
        }
        .frame(width: 200, height: 200)
    }
}


#Preview {
    ContentView()
}

#Preview {
    CanvasExample()
}

#Preview {
    CanvasPathExample()
}

#Preview {
    CanvasTextExample()
}

#Preview {
    CanvasImageExample()
}

#Preview {
    CanvasGradientExample()
}

#Preview {
    CanvasTransformExample()
}
