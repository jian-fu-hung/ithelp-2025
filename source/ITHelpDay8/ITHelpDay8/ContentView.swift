//
//  ContentView.swift
//  ITHelpDay8
//
//  Created by 洪建甫 on 2025/9/23.
//

import SwiftUI

struct VStackExample: View {
    var body: some View {
        VStack() {
            Text("上方文字")
                .background(Color.yellow)
            Text("下方文字")
                .background(Color.red)
        }
    }
}

struct HStackExample: View {
    var body: some View {
        HStack {
            Text("左方文字")
                .background(Color.yellow)
            Text("右方文字")
                .background(Color.red)
        }
    }
}

struct ZStackExample: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.yellow)
            Text("Hello, world!")
        }
    }
}

struct HStackSpacerExample: View {
    var body: some View {
        HStack {
            Text("左方文字")
                .background(Color.yellow)
            Spacer()
            Text("右方文字")
                .background(Color.red)
        }
    }
}

struct PaddingExample: View {
    var body: some View {
        HStack {
            Text("左方文字")
                .background(Color.yellow)
                .padding(50)
            Text("右方文字")
                .background(Color.red)
        }
    }
}

struct VStackAlignmentExample: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("上方文字")
                .background(Color.yellow)
            Text("下方文字123456789")
                .background(Color.red)
        }
    }
}

struct HStackAlignmentExample: View {
    var body: some View {
        HStack(alignment:.bottom ) {
            Text("上方文字")
                .background(Color.yellow)
            Text("下方文字\n123456789")
                .background(Color.red)
        }
    }
}

struct FrameExample: View {
    var body: some View {
        VStack {
            Text("固定大小")
                .frame(width: 200, height: 100)
                .background(Color.yellow)
            Text("最大寬度")
                .frame(maxWidth: .infinity)
                .background(Color.red)
        }

    }
}

struct GridExample: View {
    var body: some View {
        Grid {
            GridRow {
                Text("A1")
                    .background(Color.yellow)
                Text("B1")
                    .background(Color.red)
            }
            GridRow {
                Text("A2")
                    .background(Color.blue)
                Text("B2")
                    .background(Color.green)
            }
        }
    }
}

#Preview {
    VStackExample()
}

#Preview {
    HStackExample()
}

#Preview {
    ZStackExample()
}

#Preview {
    HStackSpacerExample()
}

#Preview {
    PaddingExample()
}

#Preview {
    VStackAlignmentExample()
}

#Preview {
    HStackAlignmentExample()
}

#Preview {
    FrameExample()
}

#Preview {
    GridExample()
}
