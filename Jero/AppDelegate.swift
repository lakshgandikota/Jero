
import UIKit
import Firebase
import CoreMotion


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var remoteConfig: RemoteConfig?
    let manager = CMMotionActivityManager()
    
    let dispatchgroup = DispatchGroup()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)
        

        
        FirebaseApp.configure()
        
        /* Remote Config - START */
        remoteConfig = RemoteConfig.remoteConfig()
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 86400
                
        remoteConfig?.configSettings = settings
        remoteConfig?.setDefaults(["t_client_id" : "Test" as NSObject])

        dispatchgroup.enter()
        remoteConfig?.fetch(withExpirationDuration: TimeInterval(0)) { (status, error) -> Void in
            if status == .success {
                self.remoteConfig?.activate(completionHandler: { (error) in
                    print("End of CONFIG FETCH\(self.remoteConfig?["t_client_secret"].stringValue ?? "NA")")
                   
                })
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
                
            }
            self.dispatchgroup.leave()
        }
        /* Remote config - END*/


        /* Auth START*/
        dispatchgroup.enter()
        Auth.auth().signInAnonymously() { (authResult, error) in
            
            if let authResult = authResult {
                print("End of AUTH: \(authResult.user) \(authResult.user.isAnonymous) \(authResult.user.uid) ")
                
            }
            self.dispatchgroup.leave()
            
        }
        /* Auth END*/
        
        /* Crash START*/
        // Fabric.sharedSDK().debug = true
        /* Crash END*/
        
        /* Firestore START*/
        
        let db = Firestore.firestore()
        print(db)
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        dispatchgroup.enter()
        ref = db.collection("log").addDocument(data: [
            "datetime": Date()
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
            self.dispatchgroup.leave()
        }
        
        /* Firestore END */
        
        /* CoreMotion START*/
        
        manager.startActivityUpdates(to: .main) { (activity) in
            guard let activity = activity else {
                return
            }

            var modes: Set<String> = []
            if activity.walking {
                modes.insert("🚶‍")
            }

            if activity.running {
                modes.insert("🏃‍")
            }

            if activity.cycling {
                modes.insert("🚴‍")
            }

            if activity.automotive {
                modes.insert("🚗")
            }

            if activity.stationary {
                modes.insert("Stationary")
            }
            
            print("Activity: \(modes.joined(separator: ", "))")

        }
        
        /* coreMotion END */
        
        let mainViewController = ViewController()
        mainViewController.view.backgroundColor = .black

        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: mainViewController)
        window?.clipsToBounds = true
        window?.makeKeyAndVisible()
        
        print("End of DIDFINISHLAUNCHING")
        
        return true
    }

    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        dispatchgroup.notify(queue: .main) {
            print("End of BACKGROUNDFETCH")
            completionHandler(.newData)
        }
        

    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print(#function)
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print(#function)
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print(#function)
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print(#function)
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print(#function)
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

