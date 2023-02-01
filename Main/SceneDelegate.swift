import UIKit
import UI

//porque passar um closure ao invés de uma instacia direto?
//resposta: ao passar a instacia direto as controllers nao seriam desalocadas e guardariam a referencia
//no entanto, ao usar closures, é possivel gerar novas instancias

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    private let signUpFactory: () -> SignUpViewController = {
        let remoteAddAccount = makeRemoteAddAccount(httpClient: makeAlamofireAdapter())
        return makeSignUpController(addAccount: remoteAddAccount)
    }
    
    private let loginFactory: () -> LoginViewController = {
        let remoteAuthentication = makeRemoteAuthentication(httpClient: makeAlamofireAdapter())
        return makeLoginController(authentication: remoteAuthentication)
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navController = NavigationController()
        let welcomeRouter = WelcomeRouter(nav: navController, loginFactory: loginFactory, signUpFactory: signUpFactory)
        let welcomeViewCOntroller = WelcomeViewController.instantiate()
        welcomeViewCOntroller.signUp = welcomeRouter.goToSignUp
        welcomeViewCOntroller.login = welcomeRouter.goToLogin
        navController.setRootViewController(welcomeViewCOntroller)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
