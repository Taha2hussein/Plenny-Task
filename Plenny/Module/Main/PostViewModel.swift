//
//  PostViewModel.swift
//  Plenny
//
//  Created by Taha Hussein on 19/09/2023.
//

import Foundation
protocol PostListViewInput {
    func fetchAllPosts()
}

final class PostViewModel: ObservableObject, PostListViewInput {
    
    @Published var postModel: ItemsModel?
    @Published var posts = [Post]()
    private var disposal = Disposal()
    let repositry: Repository

    init(repositryMock: Repository = Repository()) {
        self.repositry = repositryMock
       
    }
    
    func fetchAllPosts() {
        repositry.getAllPosts().observe { result, _ in
            guard let result = result else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let resonse):
                    self.postModel = resonse
                    self.bind()
                case .failure(let error):
                    print(error)
                }
            }
        }.add(to: &disposal)
    }
    
    func bind() {
        $postModel.map({ ($0?.posts ?? []) }).assign(to: &$posts)
    }
}
