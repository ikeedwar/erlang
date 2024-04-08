%%%-------------------------------------------------------------------
%%% @author zhangjunbo02
%%% @copyright (C) 2024, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 4月 2024 14:35
%%%-------------------------------------------------------------------
-module(helloworld).
-export([start/0,service/3]).
start() ->
  inets:start(httpd, [
    {modules, [
      mod_alias,
      mod_auth,
      mod_esi,
      mod_actions,
      mod_cgi,
      mod_dir,
      mod_get,
      mod_head,
      mod_log,
      mod_disk_log
    ]},

    {port,8081},
    {server_name,"helloworld"},
    {server_root,"/Users/zjb/erlang"},
    {document_root,"/Users/zjb/erlang/htdocs"},
    {erl_script_alias, {"/erl", [helloworld]}},
    {error_log, "error.log"},
    {security_log, "security.log"},
    {transfer_log, "transfer.log"},

    {mime_types,[
      {"html","text/html"}, {"css","text/css"}, {"js","application/x-javascript"} ]}
  ]),
  sleep(30000).

service(SessionID, _Env, _Input) -> mod_esi:deliver(SessionID, [
  "Content-Type: text/html\r\n\r\n", "<html><body>Hello, World!</body></html>" ]).

sleep(T) ->
  receive
  after T ->
    true
  end.
