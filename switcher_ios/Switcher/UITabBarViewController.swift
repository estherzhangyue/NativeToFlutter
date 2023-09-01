//
//  UITabBarViewController.swift
//  Switcher
//
//  Created by estzhang on 2023/9/1.
//

import UIKit
import Flutter

class UITabBarViewController: UITabBarController, HApi {

    private var api: FApi?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEngine()
        initTabBar()
    }

    private func setupEngine() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        HApiSetup(appDelegate.engine.binaryMessenger, self)
        api = FApi.init(binaryMessenger: appDelegate.engine.binaryMessenger)
    }
    
    func initTabBar() {
        let home = UINavigationController.init(rootViewController: ViewController())
        home.tabBarItem.title = "Home"

        api?.currentStatePage("B"){ _ in }

        let flutter = UINavigationController.init(rootViewController: FlutterWrapperViewController())
        flutter.tabBarItem.title = "Flutter"

        viewControllers = [home, flutter]

        setTabBarItemAttributes()
    }

    func setTabBarItemAttributes(fontName: String = "PingFangTC-Medium",
                                 fontSize: CGFloat = 16,
                                 normalColor: UIColor = .gray,
                                 selectedColor: UIColor = .black,
                                 bgColor: UIColor = .lightGray) {
        var attributes: [NSAttributedString.Key: Any] = [.font: UIFont(name: fontName, size: fontSize)]

        attributes[.foregroundColor] = normalColor
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)

        attributes[.foregroundColor] = selectedColor
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .selected)

        tabBar.tintColor = selectedColor
        tabBar.barTintColor = bgColor
    }

    func jump(to entry: RouteEntry, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        print("======entry:", entry.destination)
        present(NativeBViewController(), animated: true, completion: nil)
    }
}
