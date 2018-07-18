erl as grpc client
=====

An OTP application

Compile Proto file
-----

    $ rebar3 shell
    1> proto_tools:compile_all().
    2> {ok, Connection} = grpc_client:connect(tcp, "localhost", 50051).
    3> helloworld_client:'SayHello'(Connection, #{name => "World"}, []).


Build
-----

    $ rebar3 compile


Demo
------

```erlang
1> python_shell_python_shell_client:eval(ctx:new(), #{exec => "import sys", eval => "sys.version_info"}).
{ok,#{value =>
          <<"sys.version_info(major=3, minor=5, micro=2, releaselevel='final', serial=0)">>},
    #{headers =>
          #{<<":status">> => <<"200">>,
            <<"accept-encoding">> => <<"identity,gzip">>,
            <<"grpc-accept-encoding">> => <<"identity,deflate,gzip">>},
      trailers => #{}}}

2> matrixop_matrix_op_client:op(ctx:new(), #{matrixs => [#{e => [1, 1, 1], row => 3, col => 1}, #{e => [1, 1, 1], row => 1, col => 3}], op => #{value => "multiple", factory_num => 2}}).
{ok,#{matrixs => [#{col => 1,e => [3],row => 1}]},
    #{headers =>
          #{<<":status">> => <<"200">>,
            <<"accept-encoding">> => <<"identity,gzip">>,
            <<"grpc-accept-encoding">> => <<"identity,deflate,gzip">>},
      trailers => #{}}}

3> client:python_eval(#{exec => "def a(): return ['1', 2, 3, 4]", eval => "a()"}).
[<<"1">>,2,3,4]
```

py as grpc server

      cd src
      python protobuf_server_test.py