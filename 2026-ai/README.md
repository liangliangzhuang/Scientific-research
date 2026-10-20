# 科研流程与 AI 辅助科研（2026）

2026-10-20 组内分享，11 页，约 15–18 分钟；随后衔接另备的《从 Prompt 到 Skill：我的 AI 科研工作流实践》PPT。

访问：https://liangliangzhuang.github.io/Scientific-research/2026-ai/

## 查看与维护

浏览器打开 index.html；方向键翻页，F 全屏，P 查看讲者备注。图片、CSS 和 remark 脚本使用本目录相对路径。

在本目录内安装并构建：

```r
install.packages(c("xaringan", "rmarkdown"))
source("build.R")
```

需要 R 与 Pandoc（或带 Pandoc 的 RStudio）。修改 index.Rmd，版式调整在 talk.css；原主题是 xaringan-themer.css。绘图演示另需 ggplot2。

部署时保留本目录内 HTML、CSS、figure/ 和 index_files/。根目录的 2023 版保持原样，不要用本目录覆盖仓库根目录。
