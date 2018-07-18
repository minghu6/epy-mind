%%%-------------------------------------------------------------------
%% @doc Behaviour to implement for grpc service hellostreamingworld.MultiGreeter.
%% @end
%%%-------------------------------------------------------------------

%% this module was generated on 2018-07-17T07:53:07+00:00 and should not be modified manually

-module(hellostreamingworld_multi_greeter_client).

-compile([nowarn_export_all]).
-compile([export_all]).

-include_lib("grpcbox/include/grpcbox.hrl").

-define(SERVICE, 'hellostreamingworld.MultiGreeter').
-define(PROTO_MODULE, 'hellostreamingworld_pb').
-define(MARSHAL_FUN(T), fun(I) -> ?PROTO_MODULE:encode_msg(I, T) end).
-define(UNMARSHAL_FUN(T), fun(I) -> ?PROTO_MODULE:decode_msg(I, T) end).
-define(DEF(Input, Output), #grpcbox_def{service=?SERVICE,
                                         marshal_fun=?MARSHAL_FUN(Input),
                                         unmarshal_fun=?UNMARSHAL_FUN(Output)}).

%% @doc 
-spec say_hello(ctx:t()) ->
    {ok, grpclient:stream()} | grpcbox_stream:grpc_error_response().
say_hello(Ctx) ->
    say_hello(Ctx, #{}).

-spec say_hello(ctx:t(), grpcbox_client:options()) ->
    {ok, grpclient:stream()} | grpcbox_stream:grpc_error_response().
say_hello(Ctx, Options) ->
    grpcbox_client:stream(Ctx, <<"/hellostreamingworld.MultiGreeter/SayHello">>, ?DEF(hello_request, hello_reply), Options).

