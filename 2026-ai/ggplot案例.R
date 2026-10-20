# 原报告散点图示例：iris 是 R 内置数据；只依赖 ggplot2。
# 运行：Rscript ggplot案例.R；导出到临时目录，不覆盖原始图片。
# 原条形图教程的历史数据含错误字符且单位标注不一致，已移除。
# 此图只演示绘图方法，不用于因果推断。
library(ggplot2)
p <- ggplot(iris, aes(Petal.Length, Petal.Width)) +
  geom_point(size = 2, alpha = 0.5, colour = "red") +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Petal length (cm)", y = "Petal width (cm)")
if (interactive()) print(p)
ggsave(file.path(tempdir(), "iris-scatter.pdf"), p, width = 7, height = 4)
