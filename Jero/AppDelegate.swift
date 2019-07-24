
import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var bttableviewcontroller: TableViewController?
    lazy var coreDataStack = CoreDataStack(modelName: "Log")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        bttableviewcontroller = TableViewController()
        bttableviewcontroller?.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 1)
        bttableviewcontroller?.managedContext = coreDataStack.managedContext
        
        
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: bttableviewcontroller!)
        window?.clipsToBounds = true
        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print(#function)
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print(#function)
        coreDataStack.saveContext()
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
        coreDataStack.saveContext()
    }


}

