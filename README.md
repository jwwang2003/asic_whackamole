# ASIC 打地鼠游戏

## 项目描述
ASIC 打地鼠游戏是一个基于 Verilog HDL 和 FPGA/ASIC 综合流程实现的硬件小游戏。玩家通过按键“击打”随机出现的地鼠，系统根据命中情况更新得分并驱动 LED 和数码管显示当前分数和游戏状态。本项目涵盖：

- **顶层 FSM 设计**：实现游戏流程控制，包括“开始”“出现”“命中”“结束”等状态切换。  
- **子模块**：  
  - 随机数发生器（PRNG）——控制地鼠出现位置  
  - 按键抖动滤波模块——确保按钮输入稳定可靠  
  - 定时器与计数器——控制地鼠出现时长和刷新扫描  
  - 数码管驱动——实时显示得分和剩余时间  
- **综合与实现**：使用 Synopsys Design Compiler 和 FPGA 板级验证完成功能验证与性能评估。  
- **资源占用**：合成后统计 SLICE、IOB、GCLK 等资源消耗，以评估设计可移植性与优化空间。

## 本地演示
下面是在本地 FPGA 开发板上跑通后的演示视频：

<video src="demos/whackamole_final_demo.mp4" controls width="640" height="360">
  您的浏览器不支持 video 标签，请下载后本地查看：  
  [下载演示视频](demos/whackamole_demo.mp4)
</video>

## 目录结构

```text
asic_whackamole
├── demos/
│   └── whackamole_final_demo.mp4     # 本地演示视频
├── src/
│   ├── prng.v                  # 随机数生成模块
│   ├── debounce.v              # 按键去抖模块
│   ├── timer.v                 # 定时器模块
│   ├── seven_seg.v             # 数码管驱动模块
│   ├── ...
│   └── top.v                   # 顶层 FSM 与模块连接
├── report/
│   └── ASIC_FINAL.pdf          # 试验报告
└── README.md                   # 项目说明文件
```

## 快速开始
1. 克隆仓库  
   ```bash
   git clone https://your.git.repo/ASIC-Whack-a-Mole.git
   cd ASIC-Whack-a-Mole
2. 打开 Vivado 或 Synopsys 工程，导入 `src/` 和 `constraints/` 中文件。
3. 运行综合、实现和生成比特流（或网表）。
4. 下载到 FPGA 开发板，运行并按“Start”键开始游戏。