//
//  FlutterWrapperViewController.swift
//  Switcher
//
//  Created by estzhang on 2023/9/1.
//

import Foundation
import Flutter

class FlutterWrapperViewController: UIViewController, HApi {
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
        api?.currentStatePage("A"){ _ in }
        guard let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.engine else { return }
        addFlutterView(with: flutterEngine)
    }

    func addFlutterView(with engine: FlutterEngine) {
        let flutterViewController = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
        addChild(flutterViewController)

        guard let flutterView = flutterViewController.view else { return }
        flutterView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(flutterView)

        let constraints = [
            flutterView.topAnchor.constraint(equalTo: view.topAnchor),
            flutterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            flutterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            flutterView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        flutterViewController.didMove(toParent: self)

        flutterView.layoutIfNeeded()
    }

    func jump(to entry: RouteEntry, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        // can get info from flutter via 'entry'
        self.navigationController?.pushViewController(NativeBViewController(), animated: true)
    }
}

