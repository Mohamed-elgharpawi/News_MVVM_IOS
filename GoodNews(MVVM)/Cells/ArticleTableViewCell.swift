//
//  ArticleTableViewCell.swift
//  GoodNews(MVVM)
//
//  Created by mohamed elgharpawi on 05/03/2021.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    
    func generateCell(articleVM : ArticleViewModel){
        titleLabel.text = articleVM.title
        descLabel.text = articleVM.description
    }
    
}
