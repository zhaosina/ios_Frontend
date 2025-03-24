	//
//  MessagesView.swift
//  TOEFLspeaking
//
//  Created by admin on 2025/3/24.
//
import SwiftUI

struct MessagesView: View {
    var messages = [
        Message(id: 1, sender: "系统通知", content: "您的口语测试已完成评分，请查看", time: "10:30 AM", isRead: false),
        Message(id: 2, sender: "TPO助手", content: "新的TPO口语题已更新，快来练习吧", time: "昨天", isRead: true),
        Message(id: 3, sender: "学习提醒", content: "您已经连续学习3天了，继续保持！", time: "昨天", isRead: true),
        Message(id: 4, sender: "反馈回复", content: "您的问题反馈已收到，我们将尽快处理", time: "3天前", isRead: true),
        Message(id: 5, sender: "系统通知", content: "您的口语测试已完成评分，请查看", time: "10:30 AM", isRead: false),
        Message(id: 6, sender: "TPO助手", content: "新的TPO口语题已更新，快来练习吧", time: "昨天", isRead: true),
        Message(id: 7, sender: "学习提醒", content: "您已经连续学习3天了，继续保持！", time: "昨天", isRead: true),
        Message(id: 8, sender: "反馈回复", content: "您的问题反馈已收到，我们将尽快处理", time: "3天前", isRead: true),
        Message(id: 9, sender: "系统通知", content: "您的口语测试已完成评分，请查看", time: "10:30 AM", isRead: false),
        Message(id: 10, sender: "TPO助手", content: "新的TPO口语题已更新，快来练习吧", time: "昨天", isRead: true),
        Message(id: 11, sender: "学习提醒", content: "您已经连续学习3天了，继续保持！", time: "昨天", isRead: true),
        Message(id: 12, sender: "反馈回复", content: "您的问题反馈已收到，我们将尽快处理", time: "3天前", isRead: true),
        Message(id: 13, sender: "系统通知", content: "您的口语测试已完成评分，请查看", time: "10:30 AM", isRead: false),
        Message(id: 14, sender: "TPO助手", content: "新的TPO口语题已更新，快来练习吧", time: "昨天", isRead: true),
        Message(id: 15, sender: "学习提醒", content: "您已经连续学习3天了，继续保持！", time: "昨天", isRead: true),
        Message(id: 16, sender: "反馈回复", content: "您的问题反馈已收到，我们将尽快处理", time: "3天前", isRead: true)
        
        
    ]
    
    
    var body: some View {
           NavigationView {
               List {
                   ForEach(messages) { message in
                       MessageRow(message: message)
                   }
               }
               .listStyle(InsetGroupedListStyle())
               .navigationTitle("消息")
           }
       }
   }


struct Message: Identifiable {
    var id: Int
    var sender: String
    var content: String
    var time: String
    var isRead: Bool
}

struct MessageRow: View {
    var message: Message
    
    var body: some View {
        HStack(spacing: 15) {
            // 头像或图标
            ZStack {
                Circle()
                    .fill(Color(hex: "4A90E2"))
                    .frame(width: 50, height: 50)
                
                Text(String(message.sender.prefix(1)))
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(message.sender)
                        .font(.system(size: 16, weight: .medium))
                    
                    Spacer()
                    
                    Text(message.time)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                Text(message.content)
                    .font(.system(size: 15))
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            
            if !message.isRead {
                Circle()
                    .fill(Color.red)
                    .frame(width: 8, height: 8)
            }
        }
        .padding(.vertical, 8)
    }
}
