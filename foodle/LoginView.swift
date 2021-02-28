import SwiftUI

struct LoginView: View {
    
    var body: some View {
        
        // MARK: - User Interface -
        
        GeometryReader { geometry in
            
            ZStack(alignment: .top) {
                
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                    .clipShape(RoundedRectangle(cornerRadius: 48, style: .continuous))
                    .edgesIgnoringSafeArea(.bottom)
                
                VStack {
                    
                    Text("Where food\nmeets tomorrow.")
                        .font(.custom("Poppins-SemiBold", size: 24))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                }
                .multilineTextAlignment(.center)
                .padding(.top, 88)
                .frame(maxWidth: .infinity)
                .frame(height: geometry.size.height / 1.5)
                .background(
                    
                    Image(uiImage: #imageLiteral(resourceName: "ToyFaces_Colored_BG_108"))
                        .resizable()
                        .scaledToFill()
                
                )
                .clipShape(RoundedRectangle(cornerRadius: 48, style: .continuous))
                .edgesIgnoringSafeArea(.all)
                
            }
            
        }
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView()
    }
    
}
