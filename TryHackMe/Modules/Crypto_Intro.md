# Introduction to Cryptography

**Cryptographic Algorithm or Cipher**: This algorithm defines the encryption and decryption processes.
**Key**: The cryptographic algorithm needs a key to convert the plaintext into ciphertext and vice versa.
**plaintext** is the original message that we want to encrypt
**ciphertext** is the message in its encrypted form

A **symmetric encryption** algorithm uses the same key for encryption and decryption. Consequently, the communicating parties need to agree on a secret key before being able to exchange any messages.

**Asymmetric encryption** makes it possible to exchange encrypted messages without a secure channel; we just need a reliable channel. By reliable channel, we mean that we are mainly concerned with the channel’s integrity and not confidentiality. When using an asymmetric encryption algorithm, we would generate a key pair: a public key and a private key. The public key is shared with the world, or more specifically, with the people who want to communicate with us securely. The private key must be saved securely, and we must never let anyone access it. Moreover, it is not feasible to derive the private key despite the knowledge of the public key.

If a message is encrypted with one key, it can be decrypted with the other. In other words:

* If Alice encrypts a message using Bob’s public key, it can be decrypted only using Bob’s private key.
* Reversely, if Bob encrypts a message using his private key, it can only be decrypted using Bob’s public key.

## Encryption Programs

**GNU Privacy Guard** :: The GNU Privacy Guard, also known as GnuPG or GPG, implements the OpenPGP standard.

_Encryption_ `gpg --symmetric --cipher-algo CIPHER message.txt`, where CIPHER is the name of the encryption algorithm. You can check supported ciphers using the command `gpg --version`. The encrypted file will be saved as `message.txt.gpg`.

_Decryption_ `gpg --output original_message.txt --decrypt message.gpg`

**Openssl**

Encryption `openssl aes-256-cbc -e -in message.txt -out encrypted_message`

Decryption `openssl aes-256-cbc -e -in message.txt -out encrypted_message`

To make the encryption more secure and resilient against brute-force attacks, we can add -pbkdf2 to use the Password-Based Key Derivation Function 2 (PBKDF2); moreover, we can specify the number of iterations on the password to derive the encryption key using -iter NUMBER. To iterate 10,000 times, the previous command would become: `openssl aes-256-cbc -pbkdf2 -iter 10000 -e -in message.txt -out encrypted_message`

Consequently, the decryption command becomes: `openssl aes-256-cbc -pbkdf2 -iter 10000 -d -in encrypted_message -out original_message.txt`
