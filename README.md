# SwiftUI macOS Popover 气泡弹窗

## 简介

演示 SwiftUI 中 Popover 的用法，用于创建macOS风格的按钮弹窗。

## 快速开始

```bash
cd swiftui-macos-popover-demo
xcodegen generate
open SwiftUIPopoverDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### 基础 Popover

```swift
@State private var showPopover = false

Button("显示") {
    showPopover = true
}
.popover(isPresented: $showPopover) {
    PopoverContent()
}
```

### 箭头方向

```swift
.popover(isPresented: $show, arrowEdge: .bottom)
```

可选：`.top`、`.bottom`、`.leading`、`.trailing`

## 完整示例

```swift
Button("选择") {
    showPopover = true
}
.popover(isPresented: $showPopover) {
    VStack {
        Text("选择选项")
        Button("选项1") { }
        Button("选项2") { }
    }
    .padding()
}
```

## 完整讲解（中文）

### Popover 特点

- 点击外部自动关闭
- 可带箭头指向触发按钮
- 适合快速选择/操作
- 比 Sheet 更轻量

### 使用场景

- 工具栏按钮的弹出菜单
- 颜色选择器
- 表情选择器
- 快捷操作面板
