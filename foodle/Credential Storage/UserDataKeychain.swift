import Foundation

struct UserDataKeychain: Keychain {
  // Make sure the account name doesn't match the bundle identifier!
  var account = "io.digiti.foodle.SignInWithApple.Credentials"
  var service = "userIdentifier"

  typealias DataType = UserData
}
