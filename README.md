# SafeChat

A Cloud based 2 Way encrypted chat application
![ic_launcher](https://user-images.githubusercontent.com/43439545/120340565-c7464c00-c313-11eb-9bf5-6901373f5a7f.png)


Summary

The aim of the project is to propose chat application that provides 2 Way security that lets us safely exchange private information with each other without worrying about data. In addition to the protection of user data on the server, data stored on the local storage is also to be encrypted to provide better security.


Encryption Used-
![image](https://user-images.githubusercontent.com/43439545/121967098-6431cc00-cd8d-11eb-9807-756b82cd6d32.png)

AES with PKCS7 padding
Signing-
SHA256 with RSA
Usage -
Symmetric
2-way encryption is supported, so we can pre-encrypt the values (e.g. an API key or static username/password) prior to compilation — meaning we don’t have those sensitive strings exposed in plain-text in the source code or in the subsequent app-bundle that is installed on end-user devices. At runtime we can access the encrypted values and decrypt them just before making that API call or submitting a sign-in operation. For added obscurity and manageability, we can store the encrypted values outside of the code — either locally in an asset-file or remotely in a database — fetching them at runtime. In that last case it means that we, the developer, can update the values as necessary without requiring an app-update and all the release-related overhead.
We have used 128 bit key.
An AES 128-bit key can be expressed as a hexadecimal string with 32 characters. It will require 24 characters in base64.
So, the messages are stored as 24bit encrypted String in our database and the local storage.

Login Screen-
![Screenshot_20210601-194024](https://user-images.githubusercontent.com/43439545/120340643-da591c00-c313-11eb-8c92-66d6f03801fd.jpg)
![Login Screen](https://user-images.githubusercontent.com/43439545/120346946-7afe0a80-c319-11eb-9c06-23a565fab878.gif)


Dark Theme-
![Screenshot_20210601-194021](https://user-images.githubusercontent.com/43439545/120340707-e5ac4780-c313-11eb-9746-ccb8335502dd.jpg)

Conversations Screen
![Covo Screen](https://user-images.githubusercontent.com/43439545/120358367-08465c80-c324-11eb-83d6-abce0e3043e7.jpg)

Chat Screen

![chat screen](https://user-images.githubusercontent.com/43439545/120358870-a3d7cd00-c324-11eb-9041-3be5c12db36a.jpeg)


https://user-images.githubusercontent.com/43439545/120361139-25305f00-c327-11eb-8fdf-4bde26bed065.mp4




Profile Screen
![Screenshot_20210601-194052](https://user-images.githubusercontent.com/43439545/120340845-fceb3500-c313-11eb-8d1b-c2ef046018da.jpg)
![Conversations and Profile](https://user-images.githubusercontent.com/43439545/120347522-fcee3380-c319-11eb-9491-911de778d256.gif)


Amplify Initialization
![Amplify initialization](https://user-images.githubusercontent.com/43439545/120346151-bc41ea80-c318-11eb-9389-1ca14a3325c4.png)

Deployed Successfully on AWS Amplify
![Screenshot (70)](https://user-images.githubusercontent.com/43439545/120345882-84d33e00-c318-11eb-81f2-1e462dfba855.png)

AWS Auth Cognito for Authentication
![AWS Auth Cognito User Pools (1)](https://user-images.githubusercontent.com/43439545/120346436-fe6b2c00-c318-11eb-80ac-283543e1be7c.png)
![AWS Auth Cognito User Pools (2)](https://user-images.githubusercontent.com/43439545/120346452-01661c80-c319-11eb-8e52-9b0123b86bd4.png)

User Profile Information(NoSQL)
<img width="1440" alt="Users" src="https://user-images.githubusercontent.com/43439545/120359842-c4545700-c325-11eb-8ae1-7c1eab86b9db.png">

Messages Stored are Encrypted using RSA Algorithm
<img width="1440" alt="Encryption" src="https://user-images.githubusercontent.com/43439545/120361518-8bb57d00-c327-11eb-87c1-b79d81a731d9.png">
![Encrypted Message](https://user-images.githubusercontent.com/43439545/121940536-d8f40e80-cd6b-11eb-9ca7-0801fa6ef471.png)




