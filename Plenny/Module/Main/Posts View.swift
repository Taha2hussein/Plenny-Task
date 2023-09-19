//
//  Posts.swift
//  Plenny
//
//  Created by Taha Hussein on 19/09/2023.
//

import Foundation
import SwiftUI

struct PostsView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var viewModel = PostViewModel()
    
    var body: some View {
        HStack{
            Text(Localization.logo)
                .foregroundColor(.blue)
                .bold()
        }
        List(viewModel.posts) { post in
            Button(action: {
                print(post)
            }, label: {
                PostCell(post: post)
            })
        }
        .onAppear {
            viewModel.fetchAllPosts()
        }
        
    }
}

struct PostCell: View {
    var post: Post
    var body: some View {
        HStack {
            Image(Localization.loginViewImage)
                .resizable()
                .frame(width: 40,height: 40)
                .cornerRadius(20.0)
            VStack(alignment: .leading){
                Text("Taha Hussein")
                    .foregroundColor(.black)
                    .bold()
                Text("2 days ago")
                    .foregroundColor(.black)
            }
        }.setAlignment(frameAlignment: .leading)
        Text(post.body)
        Image(Localization.loginViewImage)
            .resizable()
            .frame(height: 240)
    }
}
