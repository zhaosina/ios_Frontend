//
//  ProfileView.swift
//  TOEFLspeaking
//
//  Created by admin on 2025/3/24.
//
import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // 头像和背景
                profileHeader
                
                // 用户信息卡
                userInfoCard
                
                // 选项菜单
                menuOptions
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
        .edgesIgnoringSafeArea(.top)
    }
    
    private var profileHeader: some View {
        ZStack(alignment: .bottom) {
            // 背景图
            Image("profile_background") // 请替换为实际图片资源
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .background(Color(hex: "4A90E2")) // 如果图片不存在，使用主题色
                .clipped()
            
            // 头像
            VStack {
                Image("avatar") // 请替换为实际头像图片
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .background(Circle().fill(Color.white))
                    .shadow(radius: 5)
                
                Text("用户名")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                    .shadow(radius: 2)
                
                Text("TOEFL目标: 26分")
                    .font(.system(size: 16))
                    .foregroundColor(.white.opacity(0.9))
                    .shadow(radius: 1)
                    .padding(.bottom, 20)
            }
            .offset(y: 60)
        }
        .padding(.bottom, 70)
    }
    
    private var userInfoCard: some View {
        HStack(spacing: 0) {
            // 学习天数
            statsItem(value: "14", title: "学习天数")
            
            // 分割线
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 1, height: 40)
            
            // 完成练习
            statsItem(value: "23", title: "完成练习")
            
            // 分割线
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 1, height: 40)
            
            // 平均分数
            statsItem(value: "22.5", title: "平均分数")
        }
        .frame(height: 80)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
        .padding(.horizontal)
        .padding(.top, 10)
    }
    
    private func statsItem(value: String, title: String) -> some View {
        VStack(spacing: 5) {
            Text(value)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color(hex: "4A90E2"))
            
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
    
    private var menuOptions: some View {
        VStack(spacing: 15) {
            // 成绩记录
            Group {
                menuSection(title: "学习记录")
                
                menuItem(icon: "chart.bar.fill", title: "测试成绩", subtitle: "查看所有测试的详细成绩")
                menuItem(icon: "clock.fill", title: "历史记录", subtitle: "浏览您的学习历史")
                menuItem(icon: "bookmark.fill", title: "收藏题目", subtitle: "查看已收藏的口语题目")
            }
            
            // 设置
            Group {
                menuSection(title: "应用设置")
                
                menuItem(icon: "gearshape.fill", title: "偏好设置", subtitle: "调整应用的功能和外观")
                menuItem(icon: "bell.fill", title: "通知设置", subtitle: "管理应用推送通知")
                menuItem(icon: "questionmark.circle.fill", title: "帮助与反馈", subtitle: "获取帮助或提交反馈")
            }
            
            // 账户
            Group {
                menuSection(title: "账户")
                
                menuItem(icon: "person.crop.circle.fill", title: "个人信息", subtitle: "管理您的账户信息")
                menuItem(icon: "arrow.right.square.fill", title: "退出登录", subtitle: "退出当前账户")
            }
        }
        .padding(.top, 15)
    }
    
    private func menuSection(title: String) -> some View {
        Text(title)
            .font(.system(size: 18, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top, 10)
    }
    
    private func menuItem(icon: String, title: String, subtitle: String) -> some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(Color(hex: "4A90E2"))
                .frame(width: 35, height: 35)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                
                Text(subtitle)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
