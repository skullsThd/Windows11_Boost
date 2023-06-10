-module(security).
-export([encrypt/2, decrypt/2]).

encrypt(PublicKey, Data) ->
    Encrypted = public_key:encrypt(Data, [PublicKey]),
    Encrypted.

decrypt(PrivateKey, Encrypted) ->
    Decrypted = public_key:decrypt(Encrypted, [PrivateKey]),
    Decrypted.
