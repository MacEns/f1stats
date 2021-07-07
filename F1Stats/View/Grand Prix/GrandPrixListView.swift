//
//  GrandPrixListView.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-07-07.
//

import SwiftUI

struct GrandPrixListView: View {
    // MARK: - Properties
    @EnvironmentObject var modelData: ModelData

    // MARK: - Body
    var body: some View {
        
        NavigationView {
            List {
                ForEach(modelData.grandPrix, id: \.round) { race in
                    NavigationLink( destination: GrandPrixDetailView(race: race), label: {
                        GrandPrixRowView(race: race)
                    })// NavigationLink
                }// ForEach
                
            }// List
            .navigationBarTitle("Grand Prix")
            .listStyle(InsetListStyle())
        }// NavigationView
        
    }// body
    
}// GrandPrixListView



// MARK: - Preview
struct GrandPrixListView_Previews: PreviewProvider {
    static var previews: some View {
        GrandPrixListView()
            .environmentObject(ModelData())
    }
}// Preview
