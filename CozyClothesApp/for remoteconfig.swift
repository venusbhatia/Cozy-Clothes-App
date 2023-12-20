//import UIKit
//import FirebaseRemoteConfig
//import FirebaseRemoteConfigSwift
//
//class ViewController: UIViewController {
//    
//    private let view1: UIView = {
//        let view = UIView()
//        view.backgroundColor = .systemRed
//        view.isHidden = true
//        return view
//    }()
//    
//    private let view2: UIView = {
//        let view = UIView()
//        view.backgroundColor = .systemBlue
//        view.isHidden = true
//        return view
//    }()
//    
//    private let remoteConfig = RemoteConfig.remoteConfig()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad ()
//        view.addSubview(view1)
//        view.addSubview(view2)
//        
//        fetchValues()
//        
//    }
//    
//    func fetchValues() {
//        
//        let defaults: [String: NSObject] = [
//            "shows_new_ui": false as NSObject
//        ]
//        
//        remoteConfig.setDefaults(defaults)
//        
//        let settings = RemoteConfigSettings()
//        settings.minimumFetchInterval = 0
//        remoteConfig.configSettings = settings
//        
//        let cachedValue = self.remoteConfig.configValue(forKey: "shows_new_ui").boolValue
//        updateUI(newUI: cachedValue)
//        
//        self.remoteConfig.fetch(withExpirationDuration: 0, completionHandler: { status, error in
//            
//            let value = self.remoteConfig.configValue(forKey: "shows_new_ui").boolValue
//            
//            print("\n \n Fetched: \(value)")
//            
//            DispatchQueue.main.async {
//            self.updateUI(newUI: value)
//            }
//            
//        })
//    }
// 
//    func updateUI (newUI: Bool) {
//        
//        if newUI {
//            view2.isHidden = false //blue
//        }
//        
//        else {
//    view1.isHidden = false //red
//    }
//        
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        view1.frame = view.bounds
//        view2.frame = view.bounds
//    }
//}
//
//
