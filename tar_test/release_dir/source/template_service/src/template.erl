%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%%
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(catalog). 
  


%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-include_lib("kernel/include/file.hrl").
%% --------------------------------------------------------------------



%% External exports


-export([
	]).


%% ====================================================================
%% External functions
%% ====================================================================
%% --------------------------------------------------------------------
%% Function: 
%% Description:
%% Returns: non
%% --------------------------------------------------------------------
day(Y,M,D)->
    {ok,Info}=file:consult(?LATEST_LOG),
    L=[{S#syslog_info.date,S#syslog_info.time,S#syslog_info.node,S#syslog_info.module,
		S#syslog_info.line,S#syslog_info.severity,S#syslog_info.message}||S<-Info],
    day(Y,M,D,L,[]).

day(_,_,_,[],Result)->
    Result;
day(Y,M,D,[{{Y1,M1,D1},Time,Node,Module,Line,Severity,Msg}|T],Acc) ->
    NewAcc=case {Y,M,D}=={Y1,M1,D1} of
	       true->
		   [{{Y1,M1,D1},Time,Node,Module,Line,Severity,Msg}|Acc];
	       false->
		   Acc
	   end,
    day(Y,M,D,T,NewAcc).

%% --------------------------------------------------------------------
%% Function: 
%% Description:
%% Returns: non
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% Function: 
%% Description:
%% Returns: non
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% Function: 
%% Description:
%% Returns: non
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% Function: 
%% Description:
%% Returns: non
%% --------------------------------------------------------------------

   
%% --------------------------------------------------------------------
%% Function: 
%% Description:
%% Returns: non
%% --------------------------------------------------------------------


