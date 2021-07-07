//
//  ConstructorsListView.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-06-21.
//

import SwiftUI

struct ConstructorsListView: View {
    // MARK: - Properties
    @EnvironmentObject var modelData: ModelData
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                List {

                    ForEach (modelData.constructorStandings, id:  \.constructor.constructorID) { team in
                        
                        NavigationLink (
                            destination: ConstructorDetailView(constructor: team),
                            label: {
                                ConstructorRowView(team: team)
                                    .environmentObject(modelData)
                            })
                    }// ForEach
                    
                    
                }// List
                .listStyle(InsetListStyle())
                
            }// VStack
            .navigationBarTitle("Constructors")
            
        }// NavigationView

    }// body
    
    
    
}// ConstructorsListView


// MARK: - Preview
struct ConstructorsListView_Previews: PreviewProvider {
    static var previews: some View {
        ConstructorsListView()
            .environmentObject(ModelData())
    }
}
