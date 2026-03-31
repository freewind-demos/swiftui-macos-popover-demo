import SwiftUI

struct ContentView: View {
    @State private var showPopover = false
    @State private var showColorPopover = false
    @State private var selectedColor: Color = .blue

    var body: some View {
        VStack(spacing: 40) {
            Text("Popover 气泡弹窗示例")
                .font(.title)

            // 基础 Popover
            Button("显示 Popover") {
                showPopover.toggle()
            }
            .popover(isPresented: $showPopover, arrowEdge: .bottom) {
                PopoverContentView()
            }

            // 颜色选择 Popover
            HStack {
                Circle()
                    .fill(selectedColor)
                    .frame(width: 30, height: 30)

                Button("选择颜色") {
                    showColorPopover.toggle()
                }
                .popover(isPresented: $showColorPopover, arrowEdge: .bottom) {
                    ColorPickerPopover(selectedColor: $selectedColor, isPresented: $showColorPopover)
                }
            }

            // 点击外部自动关闭的说明
            Text("Popover 点击外部会自动关闭")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(40)
    }
}

struct PopoverContentView: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("这是一个 Popover")
                .font(.headline)

            Text("Popover 是macOS常见的气泡弹窗\n常用于工具提示、快速操作等")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)

            Image(systemName: "bubble.left.and.bubble.right.fill")
                .font(.largeTitle)
                .foregroundColor(.blue)
        }
        .padding(20)
        .frame(width: 250)
    }
}

struct ColorPickerPopover: View {
    @Binding var selectedColor: Color
    @Binding var isPresented: Bool

    var body: some View {
        VStack(spacing: 15) {
            Text("选择颜色")
                .font(.headline)

            ColorPicker("颜色", selection: $selectedColor)
                .labelsHidden()

            Rectangle()
                .fill(selectedColor)
                .frame(width: 100, height: 40)
                .cornerRadius(6)

            Button("关闭") {
                isPresented = false
            }
            .buttonStyle(.borderless)
        }
        .padding(20)
        .frame(width: 200)
    }
}
