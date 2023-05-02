//
//  CurrentAuthTokenView.swift
//  Checkout
//
//  Created by Alan Morford on 4/26/23.
//

import SwiftUI


struct CurrentAuthTokenView: View {
    
    @Binding var currentAuthToken: CurrentAuthToken?
    
    var body: some View {
        Section {
            if let gotAuthToken = currentAuthToken {
                HStack {
                    Text("AuthToken:").fontWeight(.semibold).padding([.trailing],5)
                        .frame(minWidth: 90)
                    Text("\(gotAuthToken.authToken)")
                        .monospaced()
                        .minimumScaleFactor(0.3)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 200, height: 80, alignment: .trailing)

                }
                HStack {
                    Text("Refresh:").fontWeight(.semibold).padding([.trailing],5)
                        .frame(minWidth: 90)
                    Text("\(gotAuthToken.refreshToken)")
                        .monospaced()
                        .minimumScaleFactor(0.3)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 200, height: 80, alignment: .trailing)
                }
            } else {
                Label("No AuthToken", systemImage: "key.viewfinder")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .frame(minWidth: 320, minHeight: 80)
                //.background(Color.blue)
            }
        } header: {
            Text("AuthToken")
        }
    }
}

struct CurrentAuthTokenView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentAuthTokenView(currentAuthToken: .constant(nil))
        //CurrentAuthTokenView(currentAuthToken: .constant(CurrentAuthToken(authToken: test_token, refreshToken: test_token)))
    }
}

let test_token = """
  eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbGFuK3NhbmRib3hAdmlvbGV0LmlvIiwic2NvcGVzIjpbIlJPTEVfREVWRUxPUEVSIl0sInVzZXJfaWQiOjEwMjY4LCJ1c2VyX3R5cGUiOiJERVZFTE9QRVIiLCJtZXJjaGFudF9pZHMiOltdLCJkZXZlbG9wZXJfaWQiOjEwMTc0LCJhcHBfaWQiOiIxMDE5OSIsImlzcyI6Imh0dHBzOi8vdmlvbGV0LmlvIiwiaWF0IjoxNjgyNTM0OTU2LCJleHAiOjE2ODI2MjEzNTZ9.8eqrccstCmmdZnUm3HwxZ68H8WSuQxB1vDOBxnOYPfgZbZU7feTg78S3B2ucmwRjqrBpxbwjOB-1AoPpzkwznQ
"""
