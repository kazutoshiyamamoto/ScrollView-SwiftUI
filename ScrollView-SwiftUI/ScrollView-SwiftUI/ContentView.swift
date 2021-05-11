//
//  ContentView.swift
//  ScrollView-SwiftUI
//
//  Created by home on 2021/05/11.
//

import SwiftUI

struct ContentView: View {
    @State private var regions = ["北海道", "東北", "関東", "中部", "近畿", "中国", "四国", "九州", "北海道", "東北", "関東", "中部", "近畿", "中国", "四国", "九州", "北海道", "東北", "関東", "中部", "近畿", "中国", "四国", "九州"]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(Array(zip(regions.indices, regions)), id: \.0) { index, region in
                        Text(region)
                            .padding()
                            .font(.title3)
                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.1)) {
                                    proxy.scrollTo(index, anchor: .top)
                                }
                            }
                    }
                    .frame(width: geometry.size.width, alignment: .leading)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
