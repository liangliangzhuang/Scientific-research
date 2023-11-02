library(ggplot2) 

## 散点图
ggplot(data = iris, mapping = aes(Petal.Length,Petal.Width)) + 
  geom_point(size = 2,alpha = 0.5,col ="red") + 
  geom_smooth(method = "lm",se = F)



## 条形图

library(ggthemes) 
library(dplyr) 
library(readr) 
library(scales) 
library(forcats)


# 数据介绍
chilean.exports = "year,product,export,percentage 
                  2006, copper,4335009500,81
                  2006,others, 1016726518,19
                  2007,copper,9005361914,86
                  2007,others,1523085299,14
                  2008, copper,6907056354,80
                  2008, others, 1762684216, 20
                  2009,copper, 10529811075,81
                  2009,others,2464094241,19
                  2010, copper, 14828284450,85
                  2010,others,2543015596,15
                  2011,copper,15291679086,82
                  2011, others, 3447972354,18
                  2012, copper,14630686732,80
                  2012,others,3583968218,2(
                  2013,copper,15244038840,79
                  2013,others,4051281128,21
                  2014,copper,14703374241,78
                  2014,others, 4251484600,22
                  2015, copper,13155922363,78
                  2015, others, 3667286912, 22
"
charts.data = read_csv(chilean.exports)



## 条形图

p3 = ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = charts.data) + 
  geom_col() 
p3


## 增加数据标签
charts.data = charts.data %>% 
  mutate(export_label = paste(round(export/1000000000,2), "B"))
p3 = p3 + geom_text(data = charts.data, 
                    aes(x = year, y = export, label = export_label), size = 3) 
p3

## 调整数据标签位置
p3 = ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = charts.data) + geom_col()
p3 = p3 + geom_text(aes(label = export_label), position = position_stack(vjust = 0.5), size = 4) 
p3


## 调整图例位置
p3 = p3 + theme(legend.position = "bottom", legend.direction = "horizontal", legend.title = element_blank()) 
p3


## 调整 x 轴刻度
p3 = p3 + scale_x_continuous(breaks = seq(2006,2015,1)) 
p3

## 调整坐标轴标签和添加标题
p3 = p3 +
  labs(title = "Composition of Exports to China ($)", subtitle = "Source: The Observatory of Economic Complexity") +
  labs(x = "Year", y = "USD million")
p3

## 调整颜色配色
fill = c("#E1B378","#5F9EA0") 
p3 = p3 + scale_fill_manual(values = fill) 
p3


## 修改字体类型

library(showtext)
font_add_google("Gochi Hand", "gochi")
font_add_google("Schoolbell", "bell")
showtext_auto()
fill = c("#4702A1","#227CC9")

p3 = ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = charts.data) + 
  geom_col() + 
  geom_text(aes(label = export_label), position = position_stack(vjust = 0.5), 
            size = 3, family = "bell", colour = "white", show.legend = F) + 
  scale_x_continuous(breaks = seq(2006,2015,1)) + 
  labs(title = "Composition of Exports to China ($)", subtitle = "Source: The Observatory of Economic Complexity") +
  labs(x = "Year", y = "USD million") +
  scale_fill_manual(values = fill) + 
  theme(axis.line.x = element_line(linewidth = .5, colour = "black"), axis.line.y = element_line(size = .5, colour = "black"), 
        axis.text.x = element_text(colour = "black", size = 10), axis.text.y = element_text(colour = "black", size = 10), 
        legend.key = element_rect(fill = "white", colour = "white"), legend.position = "bottom", legend.direction = "horizontal", 
        legend.title = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        panel.border = element_blank(), 
        panel.background = element_blank(), 
        plot.title = element_text(family = "bell"), 
        text = element_text(family = "gochi")) + 
  guides(fill = guide_legend(reverse = T)) 
p3

## 使用自定义主题
fill = c("#b2d183","#40b8d0")

p3 = ggplot(aes(y = export, x = year, fill = fct_rev(product)), data = charts.data) + geom_col() + 
  geom_text(aes(label = export_label), position = position_stack(vjust = 0.5),
            colour = "black", family = "Tahoma", size = 3, show.legend = F) +
  scale_x_continuous(breaks = seq(2006,2015,1)) + 
  labs(title = "Composition of Exports to China ($)", subtitle = "Source: The Observatory of Economic Complexity") +
  labs(x = "Year", y = "USD million") +
  scale_fill_manual(values = fill) + 
  theme(panel.border = element_rect(colour = "black", fill = NA, linewidth = .5), 
        axis.text.x = element_text(colour = "black", size = 10), 
        axis.text.y = element_text(colour = "black", size = 10), 
        legend.key = element_rect(fill = "white", colour = "white"), 
        legend.position = "bottom", legend.direction = "horizontal", 
        legend.title = element_blank(), panel.grid.major = element_line(colour = "#d3d3d3"), 
        panel.grid.minor = element_blank(), panel.background = element_blank(),
        plot.title = element_text(size = 14, family = "Tahoma", face = "bold"), 
        text = element_text(family = "Tahoma")) + 
  guides(fill = guide_legend(reverse = T)) 
p3


# 来自《THE HITCHHIKER’S GUIDE TO GGPLOT2》： https://leanpub.com/ggplot-guide



