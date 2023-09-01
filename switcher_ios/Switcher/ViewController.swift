//
//  ViewController.swift
//  Switcher
//
//  Created by Schaban Bochi on 12.10.22.
//

import UIKit
import Flutter

class ViewController: UIViewController, HApi {
    private var api: FApi?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupEngine()
        setupUI()
    }

    private func setupEngine() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        // Setup api for incoming message
        HApiSetup(appDelegate.engine.binaryMessenger, self)
        // setup api for outgoing message
        api = FApi.init(binaryMessenger: appDelegate.engine.binaryMessenger)
    }

    private func setupUI() {
        view.backgroundColor = .white
        let jumpButton = UIButton.init(frame: CGRect.init(x: (UIScreen.main.bounds.width - 200) / 2, y: (UIScreen.main.bounds.height - 48) / 2, width: 200, height: 48))
        jumpButton.setTitle("Go To Flutter", for: .normal)
        jumpButton.backgroundColor = .black
        jumpButton.addTarget(self, action: #selector(goToFlutter), for: .touchUpInside)
        view.addSubview(jumpButton)
    }

    @objc private func goToFlutter(){
        api?.currentStatePage("A"){ (error) in
            if let error = error {
                print(error)
            }
        }
        // Get the Flutter engine from the AppDelegate
        guard let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.engine else { return }
        // One instance of the FlutterEngine can only be attached to one FlutterViewController at a time
        flutterEngine.viewController = nil
        // Create a FlutterViewController with the Flutter engine
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        guard let navigationController = self.navigationController else {
            return
        }
        navigationController.pushViewController(flutterViewController, animated: true)
    }

    func jump(to entry: RouteEntry, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        // can get info from flutter via 'entry'
        self.navigationController?.pushViewController(NativeBViewController(), animated: true)
    }
}

