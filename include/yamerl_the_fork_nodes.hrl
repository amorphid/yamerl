%-
% Copyright (c) 2012-2014 Yakaz
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions
% are met:
% 1. Redistributions of source code must retain the above copyright
%    notice, this list of conditions and the following disclaimer.
% 2. Redistributions in binary form must reproduce the above copyright
%    notice, this list of conditions and the following disclaimer in the
%    documentation and/or other materials provided with the distribution.
%
% THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
% ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
% FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
% DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
% OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
% HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
% LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
% OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
% SUCH DAMAGE.

-ifndef(yamerl_the_fork_nodes_hrl).
-define(yamerl_the_fork_nodes_hrl, true).

-include("yamerl_the_fork_types.hrl").

%% CAUTION:
%% Records defined in this file have default values for all members.
%% Those default values are often bad values but this is needed so that
%% Erlang won't add "undefined" in our back to the allowed values in the
%% type specifications.

%% -------------------------------------------------------------------
%% Nodes specifications.
%% -------------------------------------------------------------------

%% String (Failsafe Schema).
-record(yamerl_the_fork_str, {
    module = undefined            :: atom(),
    tag    = "!"                  :: tag_uri(),
    pres   = []                   :: list(),
    text   = ""                   :: unicode_string()
  }).
-type yamerl_the_fork_str()                :: #yamerl_the_fork_str{}.
-type yamerl_the_fork_simple_str()         :: unicode_string().

%% Null (Core Schema).
-record(yamerl_the_fork_null, {
    module = undefined            :: atom(),
    tag    = "!"                  :: tag_uri(),
    pres   = []                   :: list()
  }).
-type yamerl_the_fork_null()               :: #yamerl_the_fork_null{}.
-type yamerl_the_fork_simple_null()        :: null.

%% Boolean (Core Schema).
-record(yamerl_the_fork_bool, {
    module = undefined            :: atom(),
    tag    = "!"                  :: tag_uri(),
    pres   = []                   :: list(),
    value  = true                 :: boolean()
  }).
-type yamerl_the_fork_bool()               :: #yamerl_the_fork_bool{}.
-type yamerl_the_fork_simple_bool()        :: boolean().

%% Integer (Core Schema).
-record(yamerl_the_fork_int, {
    module = undefined            :: atom(),
    tag    = "!"                  :: tag_uri(),
    pres   = []                   :: list(),
    value  = 0                    :: integer()
  }).
-type yamerl_the_fork_int()                :: #yamerl_the_fork_int{}.
-type yamerl_the_fork_simple_int()         :: integer().

%% Float (Core Schema).
-record(yamerl_the_fork_float, {
    module = undefined            :: atom(),
    tag    = "!"                  :: tag_uri(),
    pres   = []                   :: list(),
    value  = 0.0                  :: float() | '+inf' | '-inf' | 'nan'
  }).
-type yamerl_the_fork_float()              :: #yamerl_the_fork_float{}.
-type yamerl_the_fork_simple_float()       :: float().

%% Erlang atom.
-record(yamerl_the_fork_erlang_atom, {
    module = undefined            :: atom(),
    tag    = "!"                  :: tag_uri(),
    pres   = []                   :: list(),
    name                          :: atom()
  }).
-type yamerl_the_fork_erlang_atom()        :: #yamerl_the_fork_erlang_atom{}.
-type yamerl_the_fork_simple_erlang_atom() :: atom().

%% Erlang anonymous function.
-record(yamerl_the_fork_erlang_fun, {
    module = undefined            :: atom(),
    tag    = "!"                  :: tag_uri(),
    pres   = []                   :: list(),
    function                      :: function(),
    text                          :: unicode_string()
  }).
-type yamerl_the_fork_erlang_fun()         :: #yamerl_the_fork_erlang_fun{}.
-type yamerl_the_fork_simple_erlang_fun()  :: function().

%% Timestamp.
-type year()   :: non_neg_integer(). %% Types from stdlib/src/calendar.erl.
-type month()  :: 1..12.
-type day()    :: 1..31.
-type hour()   :: 0..23.
-type minute() :: 0..59.
-type second() :: 0..59.
-record(yamerl_the_fork_timestamp, {
    module = undefined            :: atom(),
    tag    = "!"                  :: tag_uri(),
    pres   = []                   :: list(),
    year                          :: year() | undefined,
    month                         :: month() | undefined,
    day                           :: day() | undefined,
    hour   = 0                    :: hour(),
    minute = 0                    :: minute(),
    second = 0                    :: second(),
    frac   = 0                    :: non_neg_integer(),
    tz     = 0                    :: integer()
  }).
-type yamerl_the_fork_timestamp()          :: #yamerl_the_fork_timestamp{}.
-type yamerl_the_fork_simple_timestamp()   :: calendar:datetime()
                                   | {undefined, calendar:time()}.

%% Sequence (Failsafe Schema).
-record(yamerl_the_fork_seq, {
    module  = undefined           :: atom(),
    tag     = "!"                 :: tag_uri(),
    pres    = []                  :: list(),
    entries = []                  :: [yamerl_the_fork_node()],
    count   = 0                   :: non_neg_integer()
  }).
-type yamerl_the_fork_seq()                :: #yamerl_the_fork_seq{}.
-type yamerl_the_fork_simple_seq()         :: [yamerl_the_fork_simple_node()].
-type yamerl_the_fork_partial_seq()        :: {
                                       atom(),
                                       {seq, non_neg_integer()},
                                       [
                                         yamerl_the_fork_node()
                                         | yamerl_the_fork_simple_node()
                                         | '$insert_here'
                                       ]
                                     }.

%% Mapping (Failsafe Schema).
-record(yamerl_the_fork_map, {
    module = undefined            :: atom(),
    tag    = "!"                  :: tag_uri(),
    pres   = []                   :: list(),
    pairs  = []                   :: [{yamerl_the_fork_node(), yamerl_the_fork_node()}]
  }).
-type yamerl_the_fork_map()                :: #yamerl_the_fork_map{}.
-type yamerl_the_fork_simple_map()         :: [{
                                       yamerl_the_fork_simple_node(),
                                       yamerl_the_fork_simple_node()
                                     }].
-type yamerl_the_fork_partial_map()        :: {
                                       atom(),
                                       {map,
                                         yamerl_the_fork_node()
                                         | yamerl_the_fork_simple_node()
                                         | undefined},
                                       [{
                                         yamerl_the_fork_node()
                                         | yamerl_the_fork_simple_node()
                                         | '$insert_here',
                                         yamerl_the_fork_node()
                                         | yamerl_the_fork_simple_node()
                                         | '$insert_here' | undefined
                                       }]
                                     }.

%% Document.
-record(yamerl_the_fork_doc, {
    root = undefined              :: yamerl_the_fork_node()
                                   | yamerl_the_fork_simple_node() | undefined
  }).
-type yamerl_the_fork_doc()                :: #yamerl_the_fork_doc{root :: yamerl_the_fork_node()}.
-type yamerl_the_fork_simple_doc()         :: yamerl_the_fork_simple_node().
-type yamerl_the_fork_partial_doc()        :: #yamerl_the_fork_doc{}.

%% -------------------------------------------------------------------
%% Final data type specifications.
%% -------------------------------------------------------------------

-type yamerl_the_fork_user_node()          :: tuple().
-type yamerl_the_fork_user_simple_node()   :: term().

-type yamerl_the_fork_node()               :: yamerl_the_fork_seq()
                                   | yamerl_the_fork_map()
                                   | yamerl_the_fork_str()
                                   | yamerl_the_fork_null()
                                   | yamerl_the_fork_bool()
                                   | yamerl_the_fork_int()
                                   | yamerl_the_fork_float()
                                   | yamerl_the_fork_timestamp()
                                   | yamerl_the_fork_erlang_atom()
                                   | yamerl_the_fork_erlang_fun()
                                   | yamerl_the_fork_user_node().

-type yamerl_the_fork_simple_node()        :: yamerl_the_fork_simple_seq()
                                   | yamerl_the_fork_simple_map()
                                   | yamerl_the_fork_simple_str()
                                   | yamerl_the_fork_simple_null()
                                   | yamerl_the_fork_simple_bool()
                                   | yamerl_the_fork_simple_int()
                                   | yamerl_the_fork_simple_float()
                                   | yamerl_the_fork_simple_timestamp()
                                   | yamerl_the_fork_simple_erlang_atom()
                                   | yamerl_the_fork_simple_erlang_fun()
                                   | yamerl_the_fork_user_simple_node().

-type yamerl_the_fork_partial_node()       :: yamerl_the_fork_partial_seq()
                                   | yamerl_the_fork_partial_map()
                                   | yamerl_the_fork_str()
                                   | yamerl_the_fork_null()
                                   | yamerl_the_fork_bool()
                                   | yamerl_the_fork_int()
                                   | yamerl_the_fork_float()
                                   | yamerl_the_fork_timestamp()
                                   | yamerl_the_fork_erlang_atom()
                                   | yamerl_the_fork_erlang_fun()
                                   | yamerl_the_fork_user_node()
                                   | yamerl_the_fork_simple_str()
                                   | yamerl_the_fork_simple_null()
                                   | yamerl_the_fork_simple_bool()
                                   | yamerl_the_fork_simple_int()
                                   | yamerl_the_fork_simple_float()
                                   | yamerl_the_fork_simple_timestamp()
                                   | yamerl_the_fork_simple_erlang_atom()
                                   | yamerl_the_fork_simple_erlang_fun()
                                   | yamerl_the_fork_user_simple_node().

%% -------------------------------------------------------------------
%% Macros to access common members of the node records.
%% -------------------------------------------------------------------

-define(NODE_MOD(N),  element(#yamerl_the_fork_str.module, N)).
-define(NODE_TAG(N),  element(#yamerl_the_fork_str.tag, N)).
-define(NODE_PRES(N), element(#yamerl_the_fork_str.pres, N)).

%% -------------------------------------------------------------------
%% List of modules implementing the Core Schema nodes.
%% -------------------------------------------------------------------

-define(FAILSAFE_SCHEMA_MODS, [
    yamerl_the_fork_node_str,
    yamerl_the_fork_node_seq,
    yamerl_the_fork_node_map
  ]).

-define(JSON_SCHEMA_MODS, [
    yamerl_the_fork_node_null_json,
    yamerl_the_fork_node_bool_json,
    yamerl_the_fork_node_int_json,
    yamerl_the_fork_node_float_json,
    yamerl_the_fork_node_str_json,
    yamerl_the_fork_node_seq,
    yamerl_the_fork_node_map
  ]).

-define(CORE_SCHEMA_MODS, [
    yamerl_the_fork_node_null,
    yamerl_the_fork_node_bool,
    yamerl_the_fork_node_int,
    yamerl_the_fork_node_float,
    yamerl_the_fork_node_str,
    yamerl_the_fork_node_seq,
    yamerl_the_fork_node_map
  ]).

-define(YAML11_SCHEMA_MODS, [
    yamerl_the_fork_node_null,
    yamerl_the_fork_node_bool_ext,
    yamerl_the_fork_node_int_ext,
    yamerl_the_fork_node_float_ext,
    yamerl_the_fork_node_str,
    yamerl_the_fork_node_seq,
    yamerl_the_fork_node_map
  ]).

-endif.
