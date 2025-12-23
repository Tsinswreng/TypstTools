// 初始化层级状态：用 state 而非全局 counter，限定在上下文内
#let heading-level = state("", 0)

// 真正全自动的标题函数：嵌套调用无需手动传任何数字
#let H(Title, Content) = context {
  // 进入当前标题：层级+1（自动递增）
  heading-level.update(n => n + 1)
  // 获取当前层级（无需手动写，自动算）
  let current-lvl = heading-level.get()

  // 渲染标题（红色层级数字 + 对应层级的标题）
  heading(level: current-lvl + 1)[#Title]

  // 渲染子内容（嵌套的H会自动继承并递增层级）
  Content

  // 退出当前标题：层级回退（避免影响外部）
  heading-level.update(n => n - 1)
}
