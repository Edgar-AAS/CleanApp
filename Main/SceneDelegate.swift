import UIKit
import UI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navController = NavigationController()
        let httpClient = makeAlamofireAdapter()
        let addAccount = makeRemoteAddAccount(httpClient: httpClient)
        let signUpController = makeSignUpController(addAccount: addAccount)
        navController.setRootViewController(signUpController)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
