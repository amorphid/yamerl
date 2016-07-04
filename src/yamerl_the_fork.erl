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

-module(yamerl_the_fork).

-include("yamerl_the_fork_nodes.hrl").
-include("internal/yamerl_the_fork_constr.hrl").

%% Public API.
-export([
    decode/1,
    decode/2,
    decode_file/1,
    decode_file/2
  ]).

%% -------------------------------------------------------------------
%% Public API: YAML to Erlang.
%% -------------------------------------------------------------------

%% All those functions are only wrapper above yamerl_the_fork_constr common
%% functions. The purpose is just to avoid some typing.

-spec decode(String) ->
        Result | no_return() when
          String :: unicode_data(),
          Result :: [yamerl_the_fork_doc()]
                  | [yamerl_the_fork_simple_doc()]
                  | term().

decode(String) ->
    yamerl_the_fork_constr:string(String).

-spec decode(String, Options) ->
        Result | no_return() when
          String  :: unicode_data(),
          Options :: [ yamerl_the_fork_parser:yamerl_the_fork_parser_option()
                     | yamerl_the_fork_constr_option()
                     | proplists:property()],
          Result  :: [yamerl_the_fork_doc()]
                   | [yamerl_the_fork_simple_doc()]
                   | term().

decode(String, Options) ->
    yamerl_the_fork_constr:string(String, Options).

-spec decode_file(Filename) ->
        Result | no_return() when
          Filename :: string(),
          Result   :: [yamerl_the_fork_doc()]
                    | [yamerl_the_fork_simple_doc()]
                    | term().

decode_file(Filename) ->
    yamerl_the_fork_constr:file(Filename).

-spec decode_file(Filename, Options) ->
        Result | no_return() when
          Filename :: string(),
          Options  :: [ yamerl_the_fork_parser:yamerl_the_fork_parser_option()
                      | yamerl_the_fork_constr_option()
                      | proplists:property()],
          Result   :: [yamerl_the_fork_doc()]
                    | [yamerl_the_fork_simple_doc()]
                    | term().

decode_file(Filename, Options) ->
    yamerl_the_fork_constr:file(Filename, Options).
