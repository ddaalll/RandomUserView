//
//  ContentView.swift
//  RandomUserView1
//
//  Created by DalHyun Nam on 2023/04/16.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    var body: some View {
        
        List(randomUserViewModel.randomUsers) { aRandomUser in RandomUserRowView(aRandomUser)
                .listStyle(PlainListStyle())
            
        }
//        List(0...100, id: \.self) { index in
//            RandomUserRowView()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
