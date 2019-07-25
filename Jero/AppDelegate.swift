
import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var cdtableviewcontroller: TableViewController?
    lazy var coreDataStack = CoreDataStack(modelName: "Log")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        cdtableviewcontroller = TableViewController()
        cdtableviewcontroller?.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 1)
        cdtableviewcontroller?.managedContext = coreDataStack.managedContext

        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: cdtableviewcontroller!)
        window?.clipsToBounds = true
        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print(#function)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print(#function)
        coreDataStack.saveContext()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print(#function)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print(#function)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print(#function)
        coreDataStack.saveContext()
    }
    
}

