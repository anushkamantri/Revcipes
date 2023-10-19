//
//  TasteEvalView.swift
//  Revcipe
//
//  Created by Fanny Zheng on 10/15/23.
//

import SwiftUI

let listOfCuisines = ["Indian", "Mexican", "Italian", "American", "Japanese", "Chinese", "Mediterranean", "Thai", "Spanish", "European"]

struct TasteEvalView: View {
    @State private var buttonSubmit = "Submit";
    var body: some View {
        VStack(spacing: 125) {
            Text("Select up to 5 cuisines you like")
            
            HStack(spacing: 50) {
                VStack(spacing: 50) {
                    ForEach(0..<5) { index in
                        CuisineButton(cuisineName: listOfCuisines[index])
                    }
                }
                
                VStack(spacing: 50) {
                    ForEach(5..<10) { index in
                        CuisineButton(cuisineName: listOfCuisines[index])
                    }
                }
                
            }
            
            Button(buttonSubmit) {
                //
            }.padding(10)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}



struct CuisineButton: View {
    var cuisineName: String
    @State private var isTapped = false
    
    var body: some View {
        Button(action: {
            isTapped.toggle()
        }) {
            Text(cuisineName)
                .padding(10)
                .background(isTapped ? Color.orange : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

#Preview {
    TasteEvalView()
}
