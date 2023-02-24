//
//  CustomTabBar.swift
//  NavigationPrac
//
//  Created by Dwayne on 20/2/2023.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return .blue
        case .message:
            return .red
        case .person:
            return .indigo
        case .leaf:
            return .green
        case .gearshape:
            return .orange
        }
    }
    
    private var tabView: AnyView {
        switch selectedTab {
        case .house:
            return AnyView(HouseView())
        case .message:
            return AnyView(MessageView())
        case .person:
            return AnyView(HouseView())
        case .leaf:
            return AnyView(LeafView())
        case.gearshape:
            return AnyView(HouseView())
            
        }
    }
    
    var body: some View {
         VStack {
             tabView
             HStack {
                 ForEach(Tab.allCases, id: \.rawValue) { tab in
                     Spacer()
                     Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                         .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                         .foregroundColor(selectedTab == tab ? tabColor : .gray)
                         .font(.system(size: 22))
                         .onTapGesture {
                             withAnimation(.easeIn(duration: 0.2)) {
                                 selectedTab = tab
                             }
                         }
                     Spacer()
                 }
             }
             .frame(width: nil, height: 60)
             .background(.thinMaterial)
             .cornerRadius(10)
             .padding()
         }
     }
 }

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
    }
}
