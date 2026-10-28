import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card · 作业6',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

/// 首页 —— Tab 切换各个演示模块
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('作业6 · 基础组件与布局'),
          centerTitle: true,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: '案例复现'),
              Tab(text: '对齐任务'),
              Tab(text: '弹性分配'),
              Tab(text: '层叠角标'),
              Tab(text: '容器美化'),
              Tab(text: '约束实验'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ProfileCardPage(),    // 案例复现：profile_card
            AlignmentTaskPage(),  // 自主任务1：六种对齐场景
            FlexTaskPage(),       // 自主任务2：弹性分配实验
            StackBadgePage(),     // 自主任务3：层叠角标
            ContainerBeautyPage(),// 自主任务4：容器美化
            ConstraintExpPage(),  // 选做：约束传递实验
          ],
        ),
      ),
    );
  }
}

// ================================================================
// Tab 0: 案例复现 —— profile_card 完整实现（步骤一+步骤二+步骤三验收版）
// ================================================================
class ProfileCardPage extends StatelessWidget {
  const ProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 16,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 头像区 —— Stack + Positioned 徽标
                  const SizedBox(height: 8),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blueAccent,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        right: -4,
                        bottom: -4,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '张小明',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Flutter 开发者 · 热爱生活',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),

                  // 统计条 —— Expanded 弹性分配
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: _buildStatItem('128', '作品')),
                        Expanded(child: _buildStatItem('2.4k', '关注者')),
                        Expanded(child: _buildStatItem('96', '关注中')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 标签云 —— Wrap 流式
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: const [
                      _Chip(label: 'Flutter', color: Colors.blueAccent),
                      _Chip(label: 'Dart', color: Colors.teal),
                      _Chip(label: 'UI设计', color: Colors.purple),
                      _Chip(label: '开源', color: Colors.orange),
                      _Chip(label: '摄影', color: Colors.redAccent),
                      _Chip(label: '旅行', color: Colors.green),
                      _Chip(label: '阅读', color: Colors.brown),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final Color color;
  const _Chip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// ================================================================
// Tab 1: 对齐任务卡 —— 六种对齐场景
// ================================================================
class AlignmentTaskPage extends StatelessWidget {
  const AlignmentTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAlignmentCard(
            title: '1. CrossAxisAlignment.start',
            subtitle: '交叉轴（水平）起始对齐',
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _box(Colors.red, 60, 60),
                const SizedBox(width: 8),
                _box(Colors.blue, 60, 100),
                const SizedBox(width: 8),
                _box(Colors.green, 60, 40),
              ],
            ),
          ),
          _buildAlignmentCard(
            title: '2. CrossAxisAlignment.center',
            subtitle: '交叉轴居中对齐',
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _box(Colors.red, 60, 60),
                const SizedBox(width: 8),
                _box(Colors.blue, 60, 100),
                const SizedBox(width: 8),
                _box(Colors.green, 60, 40),
              ],
            ),
          ),
          _buildAlignmentCard(
            title: '3. CrossAxisAlignment.end',
            subtitle: '交叉轴末尾对齐',
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _box(Colors.red, 60, 60),
                const SizedBox(width: 8),
                _box(Colors.blue, 60, 100),
                const SizedBox(width: 8),
                _box(Colors.green, 60, 40),
              ],
            ),
          ),
          _buildAlignmentCard(
            title: '4. MainAxisAlignment.spaceBetween',
            subtitle: '主轴两端对齐，中间空隙均分',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _box(Colors.red, 50, 50),
                _box(Colors.blue, 50, 50),
                _box(Colors.green, 50, 50),
              ],
            ),
          ),
          _buildAlignmentCard(
            title: '5. MainAxisAlignment.spaceEvenly',
            subtitle: '主轴等间距（两端也有空隙）',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _box(Colors.red, 50, 50),
                _box(Colors.blue, 50, 50),
                _box(Colors.green, 50, 50),
              ],
            ),
          ),
          _buildAlignmentCard(
            title: '6. Column 的 start + start',
            subtitle: '纵向 Column 的对齐组合',
            child: Row(
              children: [
                Container(
                  width: 150,
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _box(Colors.red, 80, 40),
                      const SizedBox(height: 4),
                      _box(Colors.blue, 100, 40),
                      const SizedBox(height: 4),
                      _box(Colors.green, 60, 40),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: 150,
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _box(Colors.red, 80, 40),
                      const SizedBox(height: 4),
                      _box(Colors.blue, 100, 40),
                      const SizedBox(height: 4),
                      _box(Colors.green, 60, 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _box(Color c, double w, double h) {
    return Container(
      width: w,
      height: h,
      color: c.withValues(alpha: 0.8),
      alignment: Alignment.center,
      child: const Text(
        'Box',
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }

  Widget _buildAlignmentCard({
    required String title,
    required String subtitle,
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

// ================================================================
// Tab 2: 弹性分配实验 —— Expanded 比例布局
// ================================================================
class FlexTaskPage extends StatelessWidget {
  const FlexTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '三栏 2:1:1 弹性布局',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          const Text(
            '总 flex = 4，左栏占 2/4=50%，右两栏各 1/4=25%',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 80,
                  color: Colors.red.withValues(alpha: 0.7),
                  alignment: Alignment.center,
                  child: const Text('flex:2',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 80,
                  color: Colors.blue.withValues(alpha: 0.7),
                  alignment: Alignment.center,
                  child: const Text('flex:1',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 80,
                  color: Colors.green.withValues(alpha: 0.7),
                  alignment: Alignment.center,
                  child: const Text('flex:1',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            '一栏内容超长时的表现（Expanded 会让子项按比例压缩）',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 80,
                  color: Colors.red.withValues(alpha: 0.2),
                  child: const Text(
                    '这是一段非常非常非常非常长的内容，用来测试 Expanded 在内容超长时的表现。Expanded 会强制子项按 flex 比例分配剩余空间，即使内容超长也不会溢出。',
                    style: TextStyle(fontSize: 11),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 80,
                  color: Colors.blue.withValues(alpha: 0.2),
                  alignment: Alignment.center,
                  child: const Text('短内容'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            '对比：去掉 Expanded 后的溢出（故意制造）',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.yellow.shade100,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.red.withValues(alpha: 0.3),
                  child: const Text('左栏（无 Expanded）'),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.blue.withValues(alpha: 0.3),
                  child: const Text('中间栏（这里会挤爆）'),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.green.withValues(alpha: 0.3),
                  child: const Text('右栏'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '↑ 没有 Expanded 时，Row 中子组件按自身尺寸排列，宽度总和超出屏幕就会 RenderFlex overflow',
            style: TextStyle(fontSize: 11, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// Tab 3: 层叠角标 —— Stack + Positioned
// ================================================================
class StackBadgePage extends StatelessWidget {
  const StackBadgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '场景1：头像徽标（在线状态点）',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                Positioned(
                  right: -2,
                  bottom: -2,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                  ),
                ),
                // 未读消息数徽标
                Positioned(
                  right: -4,
                  top: -4,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Text('3',
                        style: TextStyle(color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '场景2：图片浮层文字',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [Colors.orangeAccent, Colors.pinkAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                // 底部渐变遮罩
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withValues(alpha: 0.7),
                          Colors.black.withValues(alpha: 0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                // 左上角标签
                Positioned(
                  left: 12,
                  top: 12,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text('HOT',
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                ),
                // 浮层文字
                const Positioned(
                  left: 16,
                  bottom: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('探索世界',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('每一天都是新的冒险',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// Tab 4: 容器美化 —— 圆角/阴影/剪裁
// ================================================================
class ContainerBeautyPage extends StatelessWidget {
  const ContainerBeautyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('卡片1：圆角 + 阴影 + 留白',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Colors.teal,
                    child: const Icon(Icons.image,
                        color: Colors.white, size: 32),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('渐变卡片',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(height: 4),
                      Text('ClipRRect 圆角剪裁 + BoxShadow 阴影',
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade600)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('卡片2：圆形剪裁 ClipOval + 渐变装饰',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.star, color: Colors.yellowAccent, size: 28),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('渐变背景',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      SizedBox(height: 4),
                      Text('BoxDecoration 支持 gradient 渐变填充',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('卡片3：ClipOval 圆形头像 + 边框装饰',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: const ClipOval(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Icon(Icons.person, size: 36, color: Colors.orange),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                child: const ClipOval(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Icon(Icons.android, size: 36, color: Colors.green),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
                child: const ClipOval(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Icon(Icons.favorite, size: 36, color: Colors.pink),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ================================================================
// Tab 5: 选做 —— 约束传递实验
// ================================================================
class ConstraintExpPage extends StatelessWidget {
  const ConstraintExpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('实验1：「撑不满」问题',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          const Text(
            'Center 给子项的是松约束 → 子按自身内容尺寸报告 → 看起来没撑满',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Container(
            height: 100,
            color: Colors.yellow.shade100,
            child: Center(
              child: Container(
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('我没撑满！'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text('修复方法：加 width: double.infinity 或用 SizedBox.expand',
              style: TextStyle(fontSize: 12, color: Colors.blueAccent)),
          Container(
            height: 100,
            color: Colors.yellow.shade100,
            child: Center(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Container(
                  color: Colors.red.withValues(alpha: 0.5),
                  alignment: Alignment.center,
                  child: const Text('我撑满了！'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('实验2：「溢出」问题',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          const Text(
            'Column 里放固定高度 + 超长 ListView → 约束装不下',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Container(
            height: 150,
            color: Colors.grey.shade200,
            child: Column(
              children: [
                Container(
                  height: 40,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: const Text('固定高度 Header'),
                ),
                // 没有 Expanded —— 这里会溢出！
                ListView(
                  children: List.generate(10, (i) => ListTile(title: Text('Item $i'))),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text('修复方法：ListView 外包 Expanded 吃掉剩余空间',
              style: TextStyle(fontSize: 12, color: Colors.blueAccent)),
          Container(
            height: 150,
            color: Colors.grey.shade200,
            child: Column(
              children: [
                Container(
                  height: 40,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: const Text('固定高度 Header'),
                ),
                Expanded(
                  child: ListView(
                    children: List.generate(10, (i) => ListTile(title: Text('Item $i'))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
