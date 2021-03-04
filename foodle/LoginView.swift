import SwiftUI
import Firebase
import AuthenticationServices

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State var keyboardIsActive = false
    @State var signInWithAppleDelegates: SignInWithAppleDelegates! = nil
    
    func disableKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func signUp() {
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                print(error?.localizedDescription ?? "Unable to register new user.")
            } else {
                print("User successfully created.")
            }

        }
        
    }
    
    func signInWithApple() {
        
        let request = ASAuthorizationAppleIDProvider().createRequest()
        
        request.requestedScopes = [.fullName, .email]
        
        signInWithAppleDelegates = SignInWithAppleDelegates() { success in
            
            if success {
                print("Sign in with apple succeeded.")
            } else {
                // Show the user an error.
            }
            
        }
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        
        controller.delegate = signInWithAppleDelegates
        controller.performRequests()
        
    }
    
    var body: some View {
        
        // MARK: - User Interface -
            
        GeometryReader { geometry in
            
            ZStack {
                
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                ZStack(alignment: .top) {
                        
                    Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 48, style: .continuous))
                        .edgesIgnoringSafeArea(.all)
                        
                    VStack {
                        
                        Text("Where food\nmeets tomorrow.")
                            .font(.custom("Poppins-SemiBold", size: 24))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                    }
                    .multilineTextAlignment(.center)
                    .padding(.top, 80)
                    .frame(maxWidth: .infinity)
                    .frame(height: geometry.size.height / 1.5)
                    .background(
                        
                        Image(uiImage: #imageLiteral(resourceName: "ToyFaces_Colored_BG_108"))
                            .resizable()
                            .scaledToFill()
                        
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 48, style: .continuous))
                    .edgesIgnoringSafeArea(.all)
                    
                    // Login layout.
                    
                    VStack(spacing: 8) {
                        
                        HStack {
                            
                            Image(systemName: "person.fill")
                                .frame(width: 48, height: 48)
                                .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                .shadow(color: Color.black.opacity(0.125), radius: 4, x: 0, y: 4)
                                .padding(.leading)
                            
                            TextField("Email".uppercased(), text: $email)
                                .keyboardType(.emailAddress)
                                .font(.custom("Poppins-Regular", size: 16))
                                .padding(.leading)
                                .frame(height: 48)
                                .onTapGesture { self.keyboardIsActive = true }
                            
                        }
                        
                        Divider()
                            .padding(.leading, 80)
                        
                        HStack {
                            
                            Image(systemName: "lock.fill")
                                .frame(width: 48, height: 48)
                                .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                .shadow(color: Color.black.opacity(0.125), radius: 4, x: 0, y: 4)
                                .padding(.leading)
                            
                            SecureField("Password".uppercased(), text: $password)
                                .keyboardType(.default)
                                .font(.custom("Poppins-Regular", size: 16))
                                .padding(.leading)
                                .frame(height: 48)
                                .onTapGesture { self.keyboardIsActive = true }
                            
                        }
                        
                    }
                    .frame(height: 144)
                    .frame(maxWidth: .infinity)
                    .background(Blur(blurStyle: .systemMaterial))
                    .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
                    .shadow(color: Color.black.opacity(0.25), radius: 24, x: 0, y: 24)
                    .padding()
                    .offset(y: geometry.size.height / 2)
                    
                    VStack(spacing: 16.0) {
                        
                        Button(action: { self.signUp() }) {
                            Text("Sign Up")
                        }
                        .padding()
                        .frame(width: 280, height: 48)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        
                        // Sign-In with Apple.
                        
                        SignInWithApple()
                            .frame(width: 280, height: 48)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .onTapGesture(perform: signInWithApple )
                        
                    }
                    .offset(y: 575)
                        
                }
                .offset(y: keyboardIsActive ? geometry.size.height / -2 : 0)
                .animation(.spring())
                .onTapGesture {
                    
                    self.keyboardIsActive = false
                    self.disableKeyboard()
                    
                }
                
            }
            
        }
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView()
    }
    
}
