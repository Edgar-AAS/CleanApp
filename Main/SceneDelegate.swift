import UIKit
import UI

//porque passar um closure ao invés de uma instacia direto?
//resposta: ao passar a instacia direto as controllers nao seriam desalocadas e guardariam a referencia
//no entanto, ao usar closures, é possivel gerar novas instancias

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navController = NavigationController()
        let welcomeViewController = makeWelcomeController(nav: navController)
        navController.setRootViewController(welcomeViewController)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
