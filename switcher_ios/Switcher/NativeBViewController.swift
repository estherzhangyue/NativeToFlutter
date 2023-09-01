//
//  NativeBViewController.swift
//  Switcher
//
//  Created by estzhang on 2023/9/1.
//

import UIKit
import Flutter

class NativeBViewController: UIViewController, HApi {
    private var api: FApi?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupEngine()
        setupUI()
    }

    private func setupEngine() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        HApiSetup(appDelegate.engine.binaryMessenger, self)
        api = FApi.init(binaryMessenger: appDelegate.engine.binaryMessenger)
    }

    private func setupUI() {
        view.backgroundColor = .orange
        let jumpButton = UIButton.init(frame: CGRect.init(x: (UIScreen.main.bounds.width - 200) / 2, y: (UIScreen.main.bounds.height - 48) / 2, width: 200, height: 48))
        jumpButton.setTitle("Go To Flutter", for: .normal)
        jumpButton.backgroundColor = .black
        jumpButton.addTarget(self, action: #selector(goToFlutter), for: .touchUpInside)
        view.addSubview(jumpButton)
    }

    @objc private func goToFlutter(){
        api?.currentStatePage("B"){ _ in }

        guard let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.engine else { return }
        flutterEngine.viewController = nil
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        guard let navigationController = self.navigationController else { return }
        navigationController.pushViewController(flutterViewController, animated: true)
    }

    func jump(to entry: RouteEntry, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        // can get info from flutter via 'entry'
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
}

