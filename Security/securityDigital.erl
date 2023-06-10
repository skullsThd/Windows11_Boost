-module(security_rsa).
-export([sign/2, verify/3]).

sign(Data, PrivateKey) ->
    crypto:start(),
    Signature = crypto:sign(sha256, Data, PrivateKey),
    Signature.

verify(Data, Signature, PublicKey) ->
    Valid = crypto:verify(sha256, Data, Signature, PublicKey),
    Valid.
