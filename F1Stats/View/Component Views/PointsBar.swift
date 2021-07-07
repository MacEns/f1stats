//
//  PointsBar.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-06-24.
//

import SwiftUI

struct PointsBar: View {
    var points: String
    var maxPoints: String
    

    
    var body: some View {
        GeometryReader { gr in
            HStack {
                ZStack (alignment: .leading){
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.secondary)
                        .frame(width: (gr.size.width * 0.85), height: 5)
                        
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.secondary)
                        .frame(width: (gr.size.width * pointPercentage() * 0.85), height: 5)
                }// ZStack
                Text(points)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }// HStack
       
    }// body
    
    // MARK: - Functions
    func pointPercentage() -> CGFloat {
        let driver: Double = Double(points) ?? 0
        let leader: Double = Double(maxPoints) ?? 0
        
        return CGFloat(driver/leader)
    }// pointPercentage()
}// PointsBar

struct PointsBar_Previews: PreviewProvider {
    static var previews: some View {
        PointsBar(points: "123", maxPoints: "150")
            .previewLayout(.sizeThatFits)
    }
}
