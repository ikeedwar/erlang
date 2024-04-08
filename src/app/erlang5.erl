%%%-------------------------------------------------------------------
%%% @author zhangjunbo02
%%% @copyright (C) 2024, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 4月 2024 15:41
%%%-------------------------------------------------------------------
-module(erlang5).
-export([start/0]).
start() ->
  Pid = spawn(fun() -> server() end),
  Pid ! {"hello4"},
  Pid ! {"hello3"},
  io:fwrite("~p",[abc]),
  sleep(1000).
server() ->
  receive
    {Message} ->
      io:fwrite("~p",[Message]),
      server()
  end.
sleep(T) ->
  receive
  after T ->
    true
  end.
