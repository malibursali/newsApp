//
//  HomeViewController.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 4.05.2021.
//

import UIKit
import Kingfisher

class HomeViewController: BaseViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var news: [News] = []
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: TableViewCells.news.name, bundle: nil), forCellReuseIdentifier: TableViewCells.news.id)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.sideMenuElementTapped), name: NotificationName.sideMenuElementTapped.name, object: nil)
        
        self.getNews(tag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "News"
        self.addSideMenuButton()
    }
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    @objc func sideMenuElementTapped() {
        self.getNews(tag)
    }
    
    
    // MARK: - Methods
    
    func getNews(_ tag: String) {
        LoadingView.shared.show()
        self.reset()
        
        NetworkService.shared.getNews("tr", tag) { (response) in
            LoadingView.shared.hide()
            
            if response.success {
                self.updateNewsFeed(response.news)
            } else {
                self.showAlert("Error!", "Something went wrong.")
            }
        }
    }
    
    func updateNewsFeed(_ news: [News]) {
        self.news = news
        self.tableView.reloadData()
    }
    
    func reset() {
        self.updateNewsFeed([])
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCells.news.id, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        let news = self.news[indexPath.row]
        
        cell.news = news
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? NewsTableViewCell else { return }
        guard let webViewController = Storyboards.webView.viewController as? WebViewController else { return }
        
        webViewController.sourceUrl = cell.news?.sourceUrl
        
        self.navigationController?.show(webViewController, sender: nil)
    }
}
