import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人名片'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 步骤一：头像区 + 姓名签名（只管结构与对齐）
              const SizedBox(height: 24),
              // 头像区
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blueAccent.shade100,
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 16),
              // 姓名
              const Text(
                '张小明',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              // 签名
              const Text(
                'Flutter 开发者 · 热爱生活',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),

              // 统计条：三个 Expanded 数字块
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _buildStatItem('128', '作品'),
                  ),
                  Expanded(
                    child: _buildStatItem('2.4k', '关注者'),
                  ),
                  Expanded(
                    child: _buildStatItem('96', '关注中'),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 标签云 Wrap
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: const [
                  _Chip(label: 'Flutter'),
                  _Chip(label: 'Dart'),
                  _Chip(label: 'UI设计'),
                  _Chip(label: '开源'),
                  _Chip(label: '摄影'),
                  _Chip(label: '旅行'),
                  _Chip(label: '阅读'),
                ],
              ),
            ],
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
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  const _Chip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
