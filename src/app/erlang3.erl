%%%-------------------------------------------------------------------
%%% @author zhangjunbo02
%%% @copyright (C) 2024, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 4月 2024 16:02
%%%-------------------------------------------------------------------
-module(erlang3).
-author("zhangjunbo02").

%% API
-export([for/2,start/0]).
for(0,_) ->
  [];

for(N,Term) when N > 0 ->
  if(N =:= 2) ->
    io:fwrite("Hello~n")
  end,
  for(N-1,Term).

start() ->
  for(5,1).
