//
//  TriangularCipher.swift
//  SpyApp
//
//  Created by Kurtis Hoang on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

//Triangular Cipher
struct TriangularCipher: Cipher{
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard var shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        //triangular sequence equation
        shiftBy = ((shiftBy*(shiftBy+1))/2);
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode + shiftBy
            
            //unicode !-~
            while (shiftedUnicode < 33)
            {
                shiftedUnicode = shiftedUnicode + 94
            }
            
            //~ = 126
            while (shiftedUnicode > 126){
                shiftedUnicode = shiftedUnicode - 94
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        guard var shiftBy = UInt32(secret) else {
            return nil
        }
        var decrypted = ""
        //triangular sequence equation
        shiftBy = ((shiftBy*(shiftBy+1))/2);
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode - shiftBy
            
            //unicode !-~
            //! = 33
            while (shiftedUnicode < 33)
            {
                shiftedUnicode = shiftedUnicode + 94
            }
            
            //~ = 126
            while (shiftedUnicode > 126){
                shiftedUnicode = shiftedUnicode - 94
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypted = decrypted + shiftedCharacter
        }
        
        return decrypted
    }
}
