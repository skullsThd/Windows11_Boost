-module(security_sha256).
-export([hash/1]).

hash(Data) ->
    Hash = crypto:hash(sha256, Data),
    Hash.
