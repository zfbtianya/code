-module(list2).
-export([flat_length/1]).
%% flat_length(List)
%% Calculate the length of a list of lists.
flat_length(List)->
    flat_length(List,0).
flat_length([H|T],N) when list(H)->
    flat_length(H,flat_length(T,N));
flat_length([H|T],N) ->
    fl(T,N+1);
flat_length([],N) ->
    N.

