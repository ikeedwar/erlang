%%%-------------------------------------------------------------------
%%% @author zhangjunbo02
%%% @copyright (C) 2024, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 4月 2024 16:52
%%%-------------------------------------------------------------------
-module(erlang4).
-export([demo1/0, demo2/0, demo3/0]).
generate_exception(1) -> a;
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'EXIT', a};
generate_exception(5) -> erlang:error(a).
demo1() ->
  [catcher(I) || I <- [1,2,3,4,5]].
catcher(N) ->
  try generate_exception(N) of
    Val -> {N, normal, Val}
  catch
    throw:X -> {N, caught, thrown, X};
    exit:X -> {N, caught, exited, X};
    error:X -> {N, caught, error, X}
  end.

demo2() ->
  [{I, (catch generate_exception(I))} || I <- [1,2,3,4,5]].
demo3() ->
  try generate_exception(5)
  catch
    error:X:Stacktrace ->
      io:format("Error: ~p~n", [X]),
      io:format("Stacktrace: ~p~n", [Stacktrace])
  end.

