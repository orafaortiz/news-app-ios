//
//  NewsListTableViewController.swift
//  News
//
//  Created by Rafael Ortiz on 01/07/21.
//

import UIKit

class NewsListTableViewController : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .darkGray, tintColor: .white, title: "Good News", preferredLargeTitle: true)
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=afbee214e1d84b99b2fa76674354fe2e")!
        
        Webservice().getArticles(url: url) { _ in
            
        }
    }
}

extension UIViewController {
    
    func configureNavigationBar(largeTitleColor: UIColor, backgoundColor: UIColor, tintColor: UIColor, title: String, preferredLargeTitle: Bool) {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: largeTitleColor]
            navBarAppearance.titleTextAttributes = [.foregroundColor: largeTitleColor]
            navBarAppearance.backgroundColor = backgoundColor

            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.compactAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

            navigationController?.navigationBar.prefersLargeTitles = preferredLargeTitle
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.tintColor = tintColor
            navigationItem.title = title

        } else {
            // Fallback on earlier versions
            navigationController?.navigationBar.prefersLargeTitles = preferredLargeTitle
            navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: largeTitleColor]
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: largeTitleColor]
            navigationController?.navigationBar.barTintColor = backgoundColor
            navigationController?.navigationBar.isTranslucent = false
            navigationItem.title = title
        }
        
//        navigationController?.navigationBar.setupShadow(
//            opacity: 0.5,
//            radius: 10,
//            offset: CGSize(width: 0, height: 10),
//            color: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
//        )
    }
}
