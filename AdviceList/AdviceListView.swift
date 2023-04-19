//
//  AdviceListView.swift
//  AdviceList
//
//  Created by Justin Zack Wei on 2023-04-19.
//

import SwiftUI

struct AdviceListView: View {
    var body: some View {
        NavigationView{
            VStack{
                
                Image(systemName: "sun.max.fill")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .foregroundColor(.yellow)
                                
                Text("State the problem in words as clearly as possible.")
                    .font(.system(size: 30))
                    .padding(50)
                                
                    

                Button(action: {
                           
                       }) {
                           Text("Generate Some Advice")
                               .font(.headline)
                               .padding()
                               .foregroundColor(.white)
                               .background(Color.blue)
                               .cornerRadius(10)
                       }
                Button(action: {
                           
                       }) {
                           Text("Save Advice")
                               .font(.caption)
                               .bold()
                               .padding()
                               .foregroundColor(.white)
                               .background(Color.green)
                               .cornerRadius(10)
                       }
                
            }
           
                .navigationTitle("Random Advice")
        }
        
    }
}
struct AdviceListView_Previews: PreviewProvider {
    static var previews: some View {
        AdviceListView()
    }
}
