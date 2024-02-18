
import Foundation
import SwiftUI

public struct LoginMainScreen: View {
    
    public var body: some View {
        VStack(content: {
            
            Spacer()
            
            Image("ic_login_logo")
                .resizable()
                .frame(width: 158, height: 60)
            
            Spacer()
            
            buttonContainerV()
                
            Spacer()
                .frame(height: 100)
        })
        .background(Color.GrayF5F5F5.ignoresSafeArea(.all))
        .toolbar(.hidden, for: .navigationBar)
    }
    
    
}

// MARK: - subviews
extension LoginMainScreen {
    @ViewBuilder
    private func buttonContainerV() -> some View {
        
        VStack(spacing: 10,
               content: {
            
            Button(
                action: {
                    
                },
                label: {
                    
                    Image("ic_login_kakao")
                        .resizable()
                        .frame(width: 280, height: 48)
                    
                })
            
            Button(
                action: {
                    
                },
                label: {
                    
                    Image("ic_login_google")
                        .resizable()
                        .frame(width: 280, height: 48)
                    
                })
            
            Button(
                action: {
                    
                },
                label: {
                    
                    Image("ic_login_apple")
                        .resizable()
                        .frame(width: 280, height: 48)
                    
                })
            
        })
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    LoginMainScreen()
}
