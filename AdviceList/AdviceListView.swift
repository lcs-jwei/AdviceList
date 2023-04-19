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
                
                HStack{
                    TextField("Enter the advice to search", text: Binding.constant(""))
                        .padding()
                    Button(action: {
                        
                    }, label:{
                        Text("ADD")
                            .font(.caption)
                        
                    })
                    .padding()
                }
                
                Button(action: {
                           
                       }) {
                           Text("Generate Some Advice")
                               .font(.headline)
                               .padding()
                               .foregroundColor(.white)
                               .background(Color.green)
                               .cornerRadius(10)
                       }
                Spacer()
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
