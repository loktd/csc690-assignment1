import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "Button": CeaserCipher(),
        "AlphanumericCeasar": AlphanumericCeaserCipher(),
        "TriangularCipher": TriangularCipher(),
        "SquaredCipher": SquaredCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
