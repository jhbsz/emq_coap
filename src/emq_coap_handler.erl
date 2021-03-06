%%--------------------------------------------------------------------
%% Copyright (c) 2016 Feng Lee <feng@emqtt.io>. All Rights Reserved.
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%--------------------------------------------------------------------

-module(emq_coap_handler).

-author("Feng Lee <feng@emqtt.io>").

-include("emq_coap.hrl").

-ifdef(use_specs).

-callback(handle_request(coap_request()) ->
          {ok, coap_response()} | {error, coap_code()}).

-callback(handle_observe(coap_request()) ->
          {ok, coap_response()} | {error, coap_code()}).

-callback(handle_unobserve(coap_request()) ->
          {ok, coap_response()} | {error, coap_code()}).

-callback(handle_info(iodata(), any()) ->
          {ok, coap_response()} | ok).

-else.

-export([behaviour_info/1]).

behaviour_info(callbacks) ->
    [{handle_request, 1}, {handle_observe, 1}, {handle_unobserve, 1}, {handle_info, 2}];
behaviour_info(_Other) ->
    undefined.

-endif.

