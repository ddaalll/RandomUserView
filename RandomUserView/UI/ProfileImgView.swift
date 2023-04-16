//
//  ProfileImgView.swift
//  RandomUserView1
//
//  Created by DalHyun Nam on 2023/04/16.
//

import Foundation
import SwiftUI
import URLImage


struct ProfileImgView : View {
    
    var imageUrl: URL
    
    var body: some View {
       
        URLImage(imageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
               
        }.frame(width: 50, height: 60)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.init(.yellow),lineWidth: 2))
    }
}

struct ProfileImgView_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = URL(string: "https://randomuser.me/api/portraits/women/41.jpg")!
       ProfileImgView(imageUrl: url)
    }
}



