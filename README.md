# Digital Signage

### Digitally signing files provided a way to verify that a file sent is the same when received and guarantee who the sender is (nonrepudiation).

Scripts to digitally sign files:
- asymmetric_keygen.sh # Will generate a private.pem key and public.pem key in /tmp directory
- digitally_sign.sh # To run before sending. Will digitally sign a file passed as a parameter with the provided private key
- digitally_verify.sh # To run on receiving end. Will verify with public key the author and integrity of the document

Setup:
```bash
 git clone https://github.com/anthony-albertina/digital-signage.git
 chmod -R +x digital-signage # Makes the scripts executable
```

### Example:

In this example, Alice would digitally sign a provided file. This hashes and encrypts the file with her private key.
After sending the file and digital signature to Bob, and he would verify the signature by hashing the original file,
and decrypting the digital signature with Alice's public key. If the hashes are the same, then we guarantee the integrity of the file. 

![example](https://github.com/anthony-albertina/digital-signage/blob/master/digital-signage.png)
