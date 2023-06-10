-module(security_aes).
-export([encrypt/2, decrypt/2]).

encrypt(Data, Key) ->
    crypto:start(),
    Encrypted = crypto:strong_rand_bytes(16),
    IV = crypto:strong_rand_bytes(16),
    Cipher = crypto:aes_cbc_encrypt(Key, IV, Data),
    {Encrypted, IV, Cipher}.

decrypt({Encrypted, IV, Cipher}, Key) ->
    Decrypted = crypto:aes_cbc_decrypt(Key, IV, Cipher),
    Decrypted.
