%%%-------------------------------------------------------------------
%% @doc Behaviour to implement for grpc service hellostreamingworld.MultiGreeter.
%% @end
%%%-------------------------------------------------------------------

%% this module was generated on 2018-07-17T07:53:07+00:00 and should not be modified manually

-module(hellostreamingworld_multi_greeter_bhvr).

%% @doc 
-callback say_hello(reference(), grpcbox_stream:t()) ->
    ok | grpcbox_stream:grpc_error_response().

