%%%-------------------------------------------------------------------
%% @doc Behaviour to implement for grpc service helloworld.Greeter.
%% @end
%%%-------------------------------------------------------------------

%% this module was generated on 2018-07-17T07:53:07+00:00 and should not be modified manually

-module(helloworld_greeter_bhvr).

%% @doc Unary RPC
-callback say_hello(ctx:ctx(), helloworld_pb:hello_request()) ->
    {ok, helloworld_pb:hello_reply()} | grpcbox_stream:grpc_error_response().

