//
//  AlphanumericCeaserCipherTests.swift
//  SpyAppTests
//
//  Created by Kurtis Hoang on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class AlphanumericCeaserCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = AlphanumericCeaserCipher()
    }
    
    func test_oneCharacterStirngGetsMappedToUppercaseSelfWith_0_secret() {
        let plaintext = "abcxyz"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual("ABCXYZ", result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }
    
    func test_basicTextAndSecretText(){
        let plaintext = "test"
        let result = cipher.encode(plaintext, secret: "1")
        XCTAssertEqual("UFTU", result)
    }
    
    func test_stringLessThanDecimal48(){
        let plaintext = "! *+%#"
        let result = cipher.encode(plaintext, secret: "3")
        let result1 = cipher.decrypt(plaintext, secret: "3")
        XCTAssertEqual("43DE86", result)
        XCTAssertEqual("IHRSMK", result1)
    }
    
    func test_stringGreaterThanDecimal90(){
        let plaintext = "~©{|}"
        let result = cipher.encode(plaintext, secret: "10")
        let result1 = cipher.decrypt(plaintext, secret: "10")
        XCTAssertEqual("]]Z[\\", result)
        XCTAssertEqual("P3MNO", result1)
    }
    
    func test_stringInbetween57And65() {
        let plaintext = ":;<=>?@"
        let result = cipher.encode(plaintext, secret: "1")
        let result1 = cipher.decrypt(plaintext, secret: "1")
        XCTAssertEqual("BCDEFGH", result)
        XCTAssertEqual("2345678", result1)
    }
}
