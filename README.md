# SafeChat

A Cloud based 2 Way encrypted chat application
![ic_launcher](https://user-images.githubusercontent.com/43439545/120340565-c7464c00-c313-11eb-9bf5-6901373f5a7f.png)


Summary

The aim of the project is to propose chat application that provides 2 Way security that lets us safely exchange private information with each other without worrying about data. In addition to the protection of user data on the server, data stored on the local storage is also to be encrypted to provide better security.


Encryption Used-
RSA-

Rivest-Shamir-Adleman is an asymmetric encryption algorithm that works off the factorization of the product of two large prime numbers. Only a user with knowledge of these two numbers can decode the message successfully. Digital signatures commonly use RSA, but the algorithm slows down when it encrypts large volumes of data.

![image](https://user-images.githubusercontent.com/43439545/120340212-6ae32c80-c313-11eb-8877-4557d907a088.png)
Idea behind rsa

The idea of RSA is based on the fact that it is difficult to factorize a large integer. The public key consists of two numbers where one number is multiplication of two large prime numbers. And private key is also derived from the same two prime numbers. 
Therefore encryption strength totally lies on the key size and if we double or triple the key size, the strength of encryption increases exponentially. RSA keys can be typically 1024 or 2048 bits long.

Login Screen-
![Screenshot_20210601-194024](https://user-images.githubusercontent.com/43439545/120340643-da591c00-c313-11eb-8c92-66d6f03801fd.jpg)

Dark Theme-
![Screenshot_20210601-194021](https://user-images.githubusercontent.com/43439545/120340707-e5ac4780-c313-11eb-9746-ccb8335502dd.jpg)

Conversations Screen
![Screenshot_20210601-194047](https://user-images.githubusercontent.com/43439545/120340774-f0ff7300-c313-11eb-8982-f88aabf1d029.jpg)

Profile Screen
![Screenshot_20210601-194052](https://user-images.githubusercontent.com/43439545/120340845-fceb3500-c313-11eb-8d1b-c2ef046018da.jpg)


Deployed Successfully on AWS Amplify
![Deployed Successfully on AWS Amplify](https://user-images.githubusercontent.com/43439545/120342933-e514b080-c315-11eb-9d87-da77a13ea7ff.png)


