x-module(security_2fa).
-export([generate_code/0, verify_code/2]).

generate_code() ->
    Code = lists:flatten(io_lib:format("~p~p~p", [rand:uniform(999), rand:uniform(999), rand:uniform(999)])),
    Code.

verify_code(EnteredCode, ExpectedCode) ->
    EnteredCode == ExpectedCode.
