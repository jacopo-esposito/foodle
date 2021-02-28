import SwiftUI

struct LoginView: View {
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .clipShape(RoundedRectangle(cornerRadius: 48, style: .continuous))
                .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                
                Text("Foodle. Lorem ipsum\ndolor sit amet.")
                    .font(.custom("Poppins-SemiBold", size: 24))
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
                
            }
            .multilineTextAlignment(.leading)
            .padding(.top, 80)
            .frame(maxWidth: .infinity)
            .frame(height: 411)
            .background(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 48, style: .continuous))
            
        }
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView()
    }
    
}
