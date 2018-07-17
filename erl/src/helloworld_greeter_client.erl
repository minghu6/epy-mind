%%%-------------------------------------------------------------------
%% @doc Behaviour to implement for grpc service helloworld.Greeter.
%% @end
%%%-------------------------------------------------------------------

%% this module was generated on 2018-07-17T07:53:07+00:00 and should not be modified manually

-module(helloworld_greeter_client).

-compile([nowarn_export_all]).
-compile([export_all]).

-include("grpcbox.hrl").

-define(SERVICE, 'helloworld.Greeter').
-define(PROTO_MODULE, 'helloworld_pb').
-define(MARSHAL_FUN(T), fun(I) -> ?PROTO_MODULE:encode_msg(I, T) end).
-define(UNMARSHAL_FUN(T), fun(I) -> ?PROTO_MODULE:decode_msg(I, T) end).
-define(DEF(Input, Output), #grpcbox_def{service=?SERVICE,
                                         marshal_fun=?MARSHAL_FUN(Input),
                                         unmarshal_fun=?UNMARSHAL_FUN(Output)}).

%% @doc Unary RPC
-spec say_hello(ctx:t(), helloworld_pb:hello_request()) ->
    {ok, helloworld_pb:hello_reply(), grpcbox:metadata()} | grpcbox_stream:grpc_error_response().
say_hello(Ctx, Input) ->
    say_hello(Ctx, Input, #{}).

-spec say_hello(ctx:t(), helloworld_pb:hello_request(), grpcbox_client:options()) ->
    {ok, helloworld_pb:hello_reply(), grpcbox:metadata()} | grpcbox_stream:grpc_error_response().
say_hello(Ctx, Input, Options) ->
    grpcbox_client:unary(Ctx, <<"/helloworld.Greeter/SayHello">>, Input, ?DEF(hello_request, hello_reply), Options).

