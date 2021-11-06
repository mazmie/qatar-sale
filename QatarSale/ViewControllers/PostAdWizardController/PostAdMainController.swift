//
//  PostAdMainControllerViewController.swift
//  QatarSale
//
//  Created by Azmi on 6.11.2021.
//

import UIKit

class PostAdMainController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var selectedCategoryLbl: UILabel!
    @IBOutlet weak var pagerContainerView: UIView!
    
    let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    var direction: UIPageViewController.NavigationDirection = .forward
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup() {
        titleLbl.setup(font: .nunito(type: .regular, size: 20), color: ._282828)
        categoryLbl.setup(font: .nunito(type: .bold, size: 18), color: ._282828)
        selectedCategoryLbl.setup(font: .nunito(type: .regular, size: 15), color: ._878787)
        
        setupPager()
        setCurrentController()
    }
    
    private func setupPager() {
        pagerContainerView.addSubview(pageViewController.view)
        self.addChild(pageViewController)
        pageViewController.didMove(toParent: self)
    }
    
    private func setCurrentController() {
        DispatchQueue.main.async {
            self.pageViewController.setViewControllers(
                [PostAdCategoryController()],
                direction: self.direction,
                animated: true,
                completion: nil)
        }
    }
}
