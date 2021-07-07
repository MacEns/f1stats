//
//  PositionNumberView.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-06-24.
//

import SwiftUI

struct PositionNumberView: View {
    var position: String
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .fill(Color.primary)
                .frame(width: 30, height: 30)
            
            Image("Position Numbers-\(position)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
        }// ZStack Position
        
    }// body
}// PositionNumberView

struct PositionNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PositionNumberView(position: "1")
    }
}
