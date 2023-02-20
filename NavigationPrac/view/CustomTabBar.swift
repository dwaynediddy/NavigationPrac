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
    
    var body: some View {
         VStack {
             HStack {
                 ForEach(Tab.allCases, id: \.rawValue) { tab in
                     Spacer()
                     Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                         .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                         .foregroundColor(selectedTab == tab ? .red : .gray)
                         .font(.system(size: 22))
                         .onTapGesture {
                             withAnimation(.easeIn(Duration: 0.2)) {
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
