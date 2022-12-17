//
//  NewsheadTableViewCell.swift
//  NewsApi
//
//  Created by Jeboy Mathew on 09/12/22.
//

import UIKit

class NewsheadTableViewCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var newsSub: UILabel!
    @IBOutlet weak var newsHead: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

//    func configure(with viewModel: TableCellModel){
//        newsHead.text = viewModel.title
//        newsSub.text = viewModel.subTitle
//        
//        if let data = viewModel.imgData{
//            contentImage.image = UIImage(data: data)
//        }
//    }
}
