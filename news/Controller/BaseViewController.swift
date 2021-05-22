//
//  BaseViewController.swift
//  news
//
//  Created by Muhammed Ali BURSALI on 4.05.2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    
    let transition = SlideInTransition()
    
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    
    // MARK: - Setup
    
    
    
    // MARK: - Actions
    
    @objc func sideMenuButtonTapped() {
        guard let sideMenuViewController = Storyboards.sideMenu.viewController as? SideMenuViewController else { return }
        
        sideMenuViewController.modalPresentationStyle = .overFullScreen
        sideMenuViewController.transitioningDelegate = self
        
        self.present(sideMenuViewController, animated: true, completion: nil)
    }
    
    
    // MARK: - Methods
    
    func addSideMenuButton() {
        let sideMenuButton = UIBarButtonItem(image: Images.sideMenu.image?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(self.sideMenuButtonTapped))
        sideMenuButton.tintColor = .white
        
        self.navigationItem.leftBarButtonItem = sideMenuButton
    }
    
    func showNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func hideNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func updateTag(_ category: CategoryType) {
        tag = category.rawValue
        NotificationCenter.default.post(name: NotificationName.sideMenuElementTapped.name, object: nil)
    }
    
    func showAlert(_ title: String, _ message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension BaseViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.transition.isPresenting = true
        return self.transition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.transition.isPresenting = false
        return self.transition
    }
}
