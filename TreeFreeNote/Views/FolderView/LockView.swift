//
//  LockView.swift
//  TreeFreeNote
//
//  Created by Baby on 01/07/23.
//

import SwiftUI

struct LockView: View {
    
    @Binding var checked: Bool
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text("Lock")
                    .font(.title3)
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .frame(width: 100, alignment: .leading)
                    .padding(.trailing, 16)
                HStack {
                    RadioButton(checked: .constant(checked), radioTitle: "Yes") {
                        self.checked.toggle()
                    } onTapToInactive: {
                        self.checked.toggle()
                    }
                    .padding(.trailing, 16)
                    RadioButton(checked: .constant(!checked), radioTitle: "No") {
                        self.checked.toggle()
                    } onTapToInactive: {
                        self.checked.toggle()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .frame(height: 35)

        }
        .padding(27)
    }
}

struct LockView_Previews: PreviewProvider {
    static var previews: some View {
        LockView(checked: .constant(true))
    }
}
