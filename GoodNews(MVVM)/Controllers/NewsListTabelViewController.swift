//
//  NewsListTabelViewController.swift
//  GoodNews(MVVM)
//
//  Created by mohamed elgharpawi on 05/03/2021.
//

import Foundation
import UIKit

class NewsListTabelViewController : UITableViewController{
    private var articleListVM:ArticleListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=db34cb331c694102b4c722fe4efd698a")!
        
        Webservice.getArticles(url: url) { articles in
            guard let articles = articles else{return}
            self.articleListVM = ArticleListViewModel(articles: articles)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }


    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : articleListVM.numOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ArticleTableViewCell
        cell.generateCell(articleVM: articleListVM.articleAtIndex(indexPath.row))
        return cell
    }
    
}
