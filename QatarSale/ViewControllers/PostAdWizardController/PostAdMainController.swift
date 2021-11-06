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
    @IBOutlet weak var buttonContainerView: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    
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
        
        nextBtn.titleLabel?.setup(font: .nunito(type: .bold, size: 20), color: .white)
        nextBtn.layer.cornerRadius = nextBtn.layer.frame.height / 2
        nextBtn.clipsToBounds = true
        nextBtn.backgroundColor = ThemeManager.Color._1b418d.color
        nextBtn.setTitleColor(.white, for: .normal)
        
        setupPager()
        setCurrentController()
        
        buttonContainerView.backgroundColor = .clear
        let gradient = CAGradientLayer()
        gradient.frame = buttonContainerView.bounds
        gradient.colors = [
            UIColor.white.withAlphaComponent(0).cgColor,
            UIColor.white.cgColor,
            UIColor.white.cgColor
        ]
        buttonContainerView.layer.insertSublayer(gradient, at: 0)
    }
    
    private func setupPager() {
        pagerContainerView.addSubview(pageViewController.view)
        self.addChild(pageViewController)
        pageViewController.didMove(toParent: self)
    }
    
    private func setCurrentController() {
        let controller = PostAdCategoryController()
        controller.selectedCategoryDidChange = { title in
            self.selectedCategoryLbl.textColor = ThemeManager.Color._0091ff.color
            self.selectedCategoryLbl.text = title
        }
        DispatchQueue.main.async {
            self.pageViewController.setViewControllers(
                [controller],
                direction: self.direction,
                animated: true,
                completion: nil)
        }
    }
}
