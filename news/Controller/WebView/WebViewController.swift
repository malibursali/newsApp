//
//  WebViewController.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 10.05.2021.
//

import UIKit
import WebKit

class WebViewController: BaseViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var webView: WKWebView!
    
    var sourceUrl: String?
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let sourceUrl = self.sourceUrl {
            guard let url = URL(string: sourceUrl) else { return }
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
}
