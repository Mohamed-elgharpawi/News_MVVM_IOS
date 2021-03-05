//
//  ArticleViewModel.swift
//  GoodNews(MVVM)
//
//  Created by mohamed elgharpawi on 05/03/2021.
//

import Foundation
struct ArticleListViewModel {
    let articles :[Article]
    
    var numOfSections : Int{
        return 1
    }
    func numberOfRowsInSection(_ section : Int)->Int{
        articles.count
    }
    func articleAtIndex(_ index : Int)->ArticleViewModel{
        return ArticleViewModel(articles[index])
    }
    
}

struct ArticleViewModel {
    var article : Article
    init(_ article:Article) {
        self.article = article
    }
    var title : String{
        return self.article.title ?? ""
    }
    var description : String{
        return self.article.articleDescription ?? ""
    }
    
}
