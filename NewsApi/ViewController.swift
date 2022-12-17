//
//  ViewController.swift
//  NewsApi
//
//  Created by Jeboy Mathew on 09/12/22.
//

import UIKit
import SafariServices
import UserNotifications

class ViewController: UIViewController {
    
    var apiCall = ApiCaller()
    
    var articles = [Article]()
    var viewModels = [TableCellModel]()

    @IBOutlet weak var newsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        notification()
        
        
        apiCall.getTopSTories { [self] result in
            switch result{
            case .success(let articles):
                self.articles = articles
                self.viewModels = articles.compactMap({
                    TableCellModel(title: $0.title, subTitle: $0.description ?? "no sub", time: $0.publishedAt , imgUrl: URL(string: $0.urlToImage ?? ""))
                })
                DispatchQueue.main.async {
                    self.newsTable.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func notification(){
        let content = UNMutableNotificationContent()
        content.title = "New news are here"
        content.body = "Start reading"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "sampleUI", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
}


extension ViewController:  UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsheadTableViewCell
        cell.newsHead.text = viewModels[indexPath.row].title
        cell.newsSub.text = viewModels[indexPath.row].subTitle
        
        cell.source.text = viewModels[indexPath.row].time
        
        if let data = viewModels[indexPath.row].imgData{
            cell.contentImage.image = UIImage(data: data)
        }else if let url = viewModels[indexPath.row].imgUrl{
            URLSession.shared.dataTask(with: url){ data, _, error in
                guard let data = data, error == nil else{
                    return
                }
                self.viewModels[indexPath.row].imgData = data
                
                
                DispatchQueue.main.async {
                    cell.contentImage.image = UIImage(data: data)
                }
            }.resume()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true )
        
        let particularArticle = articles[indexPath.row]
        
        guard let url = URL(string: particularArticle.url ?? "") else{
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
}
