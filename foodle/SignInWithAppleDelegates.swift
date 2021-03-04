import UIKit
import AuthenticationServices

class SignInWithAppleDelegates: NSObject {
    
    private let signInSucceeded: (Bool) -> Void

    init(onSignedIn: @escaping (Bool) -> Void) {
        self.signInSucceeded = onSignedIn
    }
    
}

extension SignInWithAppleDelegates: ASAuthorizationControllerDelegate {
    
    // Register new account.
    
    private func registerNewAccount(credential: ASAuthorizationAppleIDCredential) {
        
        let userData = UserData(email: credential.email!, name: credential.fullName!, identifier: credential.user)
        let keyChain = UserDataKeychain()
        
        do {
            try keyChain.store(userData)
        } catch {
            self.signInSucceeded(false)
        }
        
        do {
            
            let success = try WebApi.Register(user: userData, identityToken: credential.identityToken, authorizationCode: credential.authorizationCode)
            
            self.signInSucceeded(success)
            
        } catch {
            self.signInSucceeded(false)
        }
        
    }
    
    // Sign in with existing account.
    
    private func signInWithExistingAccount(credential: ASAuthorizationAppleIDCredential) {
        self.signInSucceeded(true)
    }
    
    // Handle username and password.
    
    private func signInWithUserAndPassword(credential: ASPasswordCredential) {
        self.signInSucceeded(true)
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        switch authorization.credential {
        
            case let appleIdCredential as ASAuthorizationAppleIDCredential:
                
                if let _ = appleIdCredential.fullName, let _ = appleIdCredential.email {
                    registerNewAccount(credential: appleIdCredential)
                } else {
                    signInWithExistingAccount(credential: appleIdCredential)
                }

                break

            case let passwordCredential as ASPasswordCredential:
                
                signInWithUserAndPassword(credential: passwordCredential)

                break

            default:
                break
                
        }
        
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
    }
    
}
