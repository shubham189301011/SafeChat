# SafeChat

A Cloud based 2 Way encrypted chat application


Summary
The aim of the project is to propose chat application that provides 2 Way security that lets us safely exchange private information with each other without worrying about data. In addition to the protection of user data on the server, data stored on the local storage is also to be encrypted to provide better security.


Encryption Used-
RSA-

Rivest-Shamir-Adleman is an asymmetric encryption algorithm that works off the factorization of the product of two large prime numbers. Only a user with knowledge of these two numbers can decode the message successfully. Digital signatures commonly use RSA, but the algorithm slows down when it encrypts large volumes of data.

![image](https://user-images.githubusercontent.com/43439545/120340212-6ae32c80-c313-11eb-8877-4557d907a088.png)
Idea behind rsa

The idea of RSA is based on the fact that it is difficult to factorize a large integer. The public key consists of two numbers where one number is multiplication of two large prime numbers. And private key is also derived from the same two prime numbers. 
Therefore encryption strength totally lies on the key size and if we double or triple the key size, the strength of encryption increases exponentially. RSA keys can be typically 1024 or 2048 bits long 
