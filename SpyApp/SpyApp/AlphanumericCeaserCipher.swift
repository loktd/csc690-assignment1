//
//  AlphanumericCeaserCipher.swift
//  SpyApp
//
//  Created by Kurtis Hoang on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

//alphanumeric Ceaser Cipher
struct AlphanumericCeaserCipher: Cipher{
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        let uppercaseText = plaintext.uppercased()
        
        for character in uppercaseText {
            
            let unicode = character.unicodeScalars.first!.value
            
            var shiftedUnicode = unicode
            
            //Unicode 0-9, A-Z
            //0 = 48, 9 = 57
            //A = 65, Z = 90
            while (shiftedUnicode < 48)
            {
                shiftedUnicode = shiftedUnicode + 16
            }
            
            while (shiftedUnicode > 57 && shiftedUnicode < 65)
            {
                shiftedUnicode = shiftedUnicode + 7
            }
            
            while (shiftedUnicode > 90) {
                shiftedUnicode = shiftedUnicode - 43
            }
            
            shiftedUnicode = shiftedUnicode + shiftBy
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter;
        }
        
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decrypted = ""
        
        let uppercaseText = plaintext.uppercased()
        
        for character in uppercaseText {
            
            let unicode = character.unicodeScalars.first!.value
            
            var shiftedUnicode = unicode
            
            //Unicode 0-9, A-Z
            //0 = 48, 9 = 57
            //A = 65, Z = 90
            while (shiftedUnicode < 48) {
                shiftedUnicode = shiftedUnicode + 43
            }
            
            //: - @, : = 58, @ = 64
            while (shiftedUnicode > 57 && shiftedUnicode < 65)
            {
                shiftedUnicode = shiftedUnicode - 7
            }
            
            while (shiftedUnicode > 90) {
                shiftedUnicode = shiftedUnicode - 36
            }
            
            shiftedUnicode = shiftedUnicode - shiftBy
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypted = decrypted + shiftedCharacter;
        }
        
        return decrypted
    }
}
