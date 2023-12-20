import SwiftUI
import Firebase
import FirebaseAnalytics
import FirebaseInstallations
import FirebaseCore
import FirebaseMessaging
import Messages
import Mixpanel
import SmartlookAnalytics
import FacebookCore

// A pair of jeggings
var jeggings: [String: Any] = [
  AnalyticsParameterItemID: "SKU_123",
  AnalyticsParameterItemName: "jeggings",
  AnalyticsParameterItemCategory: "pants",
  AnalyticsParameterItemVariant: "black",
  AnalyticsParameterItemBrand: "Google",
  AnalyticsParameterPrice: 9.99,
]

// A pair of boots
var boots: [String: Any] = [
  AnalyticsParameterItemID: "SKU_456",
  AnalyticsParameterItemName: "boots",
  AnalyticsParameterItemCategory: "shoes",
  AnalyticsParameterItemVariant: "brown",
  AnalyticsParameterItemBrand: "Google",
  AnalyticsParameterPrice: 24.99,
]

// A pair of socks
var socks: [String: Any] = [
  AnalyticsParameterItemID: "SKU_789",
  AnalyticsParameterItemName: "ankle_socks",
  AnalyticsParameterItemCategory: "socks",
  AnalyticsParameterItemVariant: "red",
  AnalyticsParameterItemBrand: "Google",
  AnalyticsParameterPrice: 5.99,
]

var PinkSweater: [String: Any] = [AnalyticsParameterItemID: "SKU_123",
                                    AnalyticsParameterItemName: "Pink Sweater",
                                    AnalyticsParameterItemCategory: "Top",
                                    AnalyticsParameterItemVariant: "Pink",
                                    AnalyticsParameterItemBrand: "H&M",
                                     AnalyticsParameterPrice: 2899,]

var BlueJeans: [String: Any] = [AnalyticsParameterItemID: "SKU_456",
                                AnalyticsParameterItemName: "Blue Jeans",
                                AnalyticsParameterItemCategory: "Jeans",
                                AnalyticsParameterItemVariant: "Blue",
                                AnalyticsParameterItemBrand: "Gucci",
                                AnalyticsParameterPrice: 1499,]

var BlackJeans: [String: Any] = [AnalyticsParameterItemID: "SKU_789",
                                AnalyticsParameterItemName: "Black Jeans",
                            AnalyticsParameterItemCategory: "Jeans",
                             AnalyticsParameterItemVariant: "Black",
                               AnalyticsParameterItemBrand: "Arrow",
                                AnalyticsParameterPrice: 1499,]

var WhiteJeans: [String: Any] = [AnalyticsParameterItemID: "SKU_799",
                                AnalyticsParameterItemName: "White Jeans",
                            AnalyticsParameterItemCategory: "Jeans",
                             AnalyticsParameterItemVariant: "White",
                               AnalyticsParameterItemBrand: "Only",
                                AnalyticsParameterPrice: 1499,]

var OrangeSweater: [String: Any] = [AnalyticsParameterItemID: "SKU_125",
                                    AnalyticsParameterItemName: "Orange Sweater",
                                    AnalyticsParameterItemCategory: "Top",
                                    AnalyticsParameterItemVariant: "Orange",
                                    AnalyticsParameterItemBrand: "H&M",
                                     AnalyticsParameterPrice: 1549,]

var RedwineSweater: [String: Any] = [AnalyticsParameterItemID: "SKU_123",
                                    AnalyticsParameterItemName: "Redwine Sweater",
                                    AnalyticsParameterItemCategory: "Top",
                                    AnalyticsParameterItemVariant: "Red",
                                    AnalyticsParameterItemBrand: "H&M",
                                     AnalyticsParameterPrice: 1899,]

var SandSweater: [String: Any] = [AnalyticsParameterItemID: "SKU_133",
                                    AnalyticsParameterItemName: "Sand Sweater",
                                    AnalyticsParameterItemCategory: "Top",
                                    AnalyticsParameterItemVariant: "Brown",
                                    AnalyticsParameterItemBrand: "H&M",
                                     AnalyticsParameterPrice: 1799,]

var SeaSweater: [String: Any] = [AnalyticsParameterItemID: "SKU_123",
                                    AnalyticsParameterItemName: "Sea Sweater",
                                    AnalyticsParameterItemCategory: "Top",
                                    AnalyticsParameterItemVariant: "Teal Blue",
                                    AnalyticsParameterItemBrand: "H&M",
                                     AnalyticsParameterPrice: 1950,]

var CreamSweater: [String: Any] = [AnalyticsParameterItemID: "SKU_123",
                                    AnalyticsParameterItemName: "Cream Sweater",
                                    AnalyticsParameterItemCategory: "Top",
                                    AnalyticsParameterItemVariant: "Cream",
                                    AnalyticsParameterItemBrand: "H&M",
                                     AnalyticsParameterPrice: 9990,]

var BeigeSweater: [String: Any] = [AnalyticsParameterItemID: "SKU_123",
                                    AnalyticsParameterItemName: "Beige Sweater",
                                    AnalyticsParameterItemCategory: "Top",
                                    AnalyticsParameterItemVariant: "Beige",
                                    AnalyticsParameterItemBrand: "H&M",
                                     AnalyticsParameterPrice: 2650,]

var GreySweater: [String: Any] = [AnalyticsParameterItemID: "SKU_123",
                                    AnalyticsParameterItemName: "Grey Sweater",
                                    AnalyticsParameterItemCategory: "Top",
                                    AnalyticsParameterItemVariant: "Grey",
                                    AnalyticsParameterItemBrand: "H&M",
                                     AnalyticsParameterPrice: 2499,]

var MinkSweater: [String: Any] = [AnalyticsParameterItemID: "SKU_123",
                                    AnalyticsParameterItemName: "Mink Sweater",
                                    AnalyticsParameterItemCategory: "Top",
                                    AnalyticsParameterItemVariant: "Mink",
                                    AnalyticsParameterItemBrand: "H&M",
                                     AnalyticsParameterPrice: 1899,]

class TrackingManager {
    static let shared = TrackingManager()
    
    private init() {}
    
    func trackFeatureUsage(featureName: String) {
        print("Feature 'CozyClothes app' was used.")
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        Mixpanel.initialize(token: "7a5b4bf591257de43e128dc919531cc1", trackAutomaticEvents: true)
        Mixpanel.mainInstance().track(event: "Signed Up", properties: [
            "Signup Type": "Referral",
        ])
        Mixpanel.mainInstance().loggingEnabled = true
                return true
    }
    
    let gcmMessageIDKey = "gcm.message_id"
    var fcmRegTokenMessage = UITextView()
    
   // let appInstanceID = Analytics.appInstanceID()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        
        var newArguments = ProcessInfo.processInfo.arguments
                newArguments.append("-FIRAnalyticsDebugEnabled")
                newArguments.append("-FIRDebugEnabled")
                newArguments.append("-FIRAnalyticsVerboseLoggingEnabled")
                ProcessInfo.processInfo.setValue(newArguments, forKey: "arguments")
        
        
        FirebaseApp.configure()
        
        Installations.installations().installationID { id, error in
            print("ID used to debug Firebase InApp Messaging: \(String(describing: id))")
        }
        
        UNUserNotificationCenter.current().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
        )
        
        application.registerForRemoteNotifications()
        
        Messaging.messaging().delegate = self
        
        Messaging.messaging().token { token, error in
          if let error = error {
            print("Error fetching FCM registration token: \(error)")
          } else if let token = token {
            print("FCM registration token: \(token)")
            self.fcmRegTokenMessage.text  = "Remote FCM registration token: \(token)"
          }
        }
        
        return true
    }
    
    func application(application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      Messaging.messaging().apnsToken = deviceToken
    }

    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any]) async
      -> UIBackgroundFetchResult {
      // If you are receiving a notification message while your app is in the background,
      // this callback will not be fired till the user taps on the notification launching the application.
      // TODO: Handle data of notification

      // With swizzling disabled you must let Messaging know about the message, for Analytics
      // Messaging.messaging().appDidReceiveMessage(userInfo)

      // Print message ID.
      if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
          
        //  print("Venus App Instance ID: \(appInstanceID)")
      }

      // Print full message.
      print(userInfo)
      return UIBackgroundFetchResult.newData
    }
}


extension AppDelegate: UNUserNotificationCenterDelegate {
  // Receive displayed notifications for iOS 10 devices.
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification) async
    -> UNNotificationPresentationOptions {
    let userInfo = notification.request.content.userInfo

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // Messaging.messaging().appDidReceiveMessage(userInfo)

    // ...

    // Print full message.
    print(userInfo)

    // Change this to your preferred presentation option
        return [[.sound, .badge]]
  }

  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse) async {
    let userInfo = response.notification.request.content.userInfo

    // ...

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // Messaging.messaging().appDidReceiveMessage(userInfo)

    // Print full message.
    print(userInfo)
  }
}

extension AppDelegate: MessagingDelegate{
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase registration token: \(String(describing: fcmToken))")
        
        let dataDict: [String: String] = ["token": fcmToken ?? ""]
        NotificationCenter.default.post(
            name: Notification.Name("FCMToken"),
            object: nil,
            userInfo: dataDict
        )
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
}

//@main
//
//struct CozyClothesApp: App {
//
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    var body: some Scene {
//        WindowGroup {
//            MainTabView()
//        }
//    }
//}


@main
struct CozyClothesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(Smartlook.instance
                    .preferences(
                        Preferences(projectKey: "e9566417c2c5cdc1881bac131626bd686454b481")
                    )
                    .start()
                )
        }
    }
}
