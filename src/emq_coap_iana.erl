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

-module(emq_coap_iana).

-author("Feng Lee <feng@emqtt.io>").

-include("emq_coap.hrl").

-export([type_name/1, type_enum/1, method_name/1, method_code/1, resp_method_name/1, resp_method_code/1]).

-spec(type_name(integer()) -> coap_type()).
type_name(0) -> 'CON';
type_name(1) -> 'NON';
type_name(2) -> 'ACK';
type_name(3) -> 'RST'.

-spec(type_enum(coap_type()) -> integer()).
type_enum('CON') -> 0;
type_enum('NON') -> 1;
type_enum('ACK') -> 2;
type_enum('RST') -> 3.

% +------+--------+-----------+
% | Code | Name   | Reference |
% +------+--------+-----------+
% | 0.01 | GET    | [RFC7252] |
% | 0.02 | POST   | [RFC7252] |
% | 0.03 | PUT    | [RFC7252] |
% | 0.04 | DELETE | [RFC7252] |
% +------+--------+-----------+

-spec(method_name({pos_integer(), pos_integer()}) -> coap_method()).
method_name({0, 01}) -> 'GET';
method_name({0, 02}) -> 'POST';
method_name({0, 03}) -> 'PUT';
method_name({0, 04}) -> 'DELETE';
method_name({_, _})  -> undefined.

-spec(method_code(coap_method()) -> {pos_integer(), pos_integer()}).
method_code('GET')    -> {0, 01}; 
method_code('POST')   -> {0, 02};
method_code('PUT')    -> {0, 03};
method_code('DELETE') -> {0, 04}.



% CoAP Response Codes:
% +------+------------------------------+-----------+
% | Code | Description                  | Reference |
% +------+------------------------------+-----------+
% | 2.01 | Created                      | [RFC7252] |
% | 2.02 | Deleted                      | [RFC7252] |
% | 2.03 | Valid                        | [RFC7252] |
% | 2.04 | Changed                      | [RFC7252] |
% | 2.05 | Content                      | [RFC7252] |
% | 4.00 | Bad Request                  | [RFC7252] |
% | 4.01 | Unauthorized                 | [RFC7252] |
% | 4.02 | Bad Option                   | [RFC7252] |
% | 4.03 | Forbidden                    | [RFC7252] |
% | 4.04 | Not Found                    | [RFC7252] |
% | 4.05 | Method Not Allowed           | [RFC7252] |
% | 4.06 | Not Acceptable               | [RFC7252] |
% | 4.12 | Precondition Failed          | [RFC7252] |
% | 4.13 | Request Entity Too Large     | [RFC7252] |
% | 4.15 | Unsupported Content-Format   | [RFC7252] |
% | 5.00 | Internal Server Error        | [RFC7252] |
% | 5.01 | Not Implemented              | [RFC7252] |
% | 5.02 | Bad Gateway                  | [RFC7252] |
% | 5.03 | Service Unavailable          | [RFC7252] |
% | 5.04 | Gateway Timeout              | [RFC7252] |
% | 5.05 | Proxying Not Supported       | [RFC7252] |
% +------+------------------------------+-----------+
resp_method_name({2,01}) -> 'Created'; 
resp_method_name({2,02}) -> 'Deleted'; 
resp_method_name({2,03}) -> 'Valid'; 
resp_method_name({2,04}) -> 'Changed'; 
resp_method_name({2,05}) -> 'Content';
resp_method_name({2,31}) -> 'Continue';


resp_method_name({4,00}) -> 'BadRequest'; 
resp_method_name({4,01}) -> 'Unauthorized'; 
resp_method_name({4,02}) -> 'BadOption'; 
resp_method_name({4,03}) -> 'Forbidden'; 
resp_method_name({4,04}) -> 'NotFound';
resp_method_name({4,05}) -> 'MethodNotAllowed'; 
resp_method_name({4,06}) -> 'NotAcceptable'; 
resp_method_name({4,12}) -> 'PreconditionFailed'; 
resp_method_name({4,13}) -> 'RequestEntityTooLarge'; 
resp_method_name({4,15}) -> 'UnsupportedContentFormat'; 

resp_method_name({5,00}) -> 'InternalServerError'; 
resp_method_name({5,01}) -> 'NotImplemented'; 
resp_method_name({5,02}) -> 'BadGateway'; 
resp_method_name({5,03}) -> 'ServiceUnavailable'; 
resp_method_name({5,04}) -> 'GatewayTimeout'; 
resp_method_name({5,05}) -> 'ProxyingNotSupported'.


resp_method_code('Created') -> {2,01}; 
resp_method_code('Deleted') -> {2,02}; 
resp_method_code('Valid')   -> {2,03}; 
resp_method_code('Changed') -> {2,04}; 
resp_method_code('Content') -> {2,05}; 
resp_method_code('Continue')-> {2,31}; 

resp_method_code('BadRequest')               -> {4,00}; 
resp_method_code('Unauthorized')             -> {4,01}; 
resp_method_code('BadOption')                -> {4,02}; 
resp_method_code('Forbidden')                -> {4,03}; 
resp_method_code('NotFound')                 -> {4,04}; 
resp_method_code('MethodNotAllowed')         -> {4,05}; 
resp_method_code('NotAcceptable')            -> {4,06}; 
resp_method_code('PreconditionFailed')       -> {4,12}; 
resp_method_code('RequestEntityTooLarge')    -> {4,13}; 
resp_method_code('UnsupportedContentFormat') -> {4,15};

resp_method_code('InternalServerError')  -> {5,00};
resp_method_code('NotImplemented')       -> {5,01};
resp_method_code('BadGateway')           -> {5,02};
resp_method_code('ServiceUnavailable')   -> {5,03}; 
resp_method_code('GatewayTimeout')       -> {5,04};
resp_method_code('ProxyingNotSupported') -> {5,05};
resp_method_code(_) -> {0,00}.


% +--------+------------------+-----------+
% | Number | Name             | Reference |
% +--------+------------------+-----------+
% |      0 | (Reserved)       | [RFC7252] |
% |      1 | If-Match         | [RFC7252] |
% |      3 | Uri-Host         | [RFC7252] |
% |      4 | ETag             | [RFC7252] |
% |      5 | If-None-Match    | [RFC7252] |
% |      7 | Uri-Port         | [RFC7252] |
% |      8 | Location-Path    | [RFC7252] |
% |     11 | Uri-Path         | [RFC7252] |
% |     12 | Content-Format   | [RFC7252] |
% |     14 | Max-Age          | [RFC7252] |
% |     15 | Uri-Query        | [RFC7252] |
% |     17 | Accept           | [RFC7252] |
% |     20 | Location-Query   | [RFC7252] |
% |     35 | Proxy-Uri        | [RFC7252] |
% |     39 | Proxy-Scheme     | [RFC7252] |
% |     60 | Size1            | [RFC7252] |
% |    128 | (Reserved)       | [RFC7252] |
% |    132 | (Reserved)       | [RFC7252] |
% |    136 | (Reserved)       | [RFC7252] |
% |    140 | (Reserved)       | [RFC7252] |
% +--------+------------------+-----------+

%% CoAP Content-Formats Registry
%%
%% +--------------------------+----------+----+------------------------+
%% | Media type               | Encoding | ID | Reference              |
%% +--------------------------+----------+----+------------------------+
%% | text/plain;              | -        |  0 | [RFC2046] [RFC3676]    |
%% | charset=utf-8            |          |    | [RFC5147]              |
%% | application/link-format  | -        | 40 | [RFC6690]              |
%% | application/xml          | -        | 41 | [RFC3023]              |
%% | application/octet-stream | -        | 42 | [RFC2045] [RFC2046]    |
%% | application/exi          | -        | 47 | [REC-exi-20140211]     |
%% | application/json         | -        | 50 | [RFC7159]              |
%% +--------------------------+----------+----+------------------------+

-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

type_test() ->
    ?assertEqual(0, type_enum(type_name(0))),
    ?assertEqual(1, type_enum(type_name(1))),
    ?assertEqual(2, type_enum(type_name(2))),
    ?assertEqual(3, type_enum(type_name(3))).

method_test() ->
    ?assertEqual('GET', method_name(method_code('GET'))),
    ?assertEqual('POST', method_name(method_code('POST'))),
    ?assertEqual('PUT', method_name(method_code('PUT'))),
    ?assertEqual('DELETE', method_name(method_code('DELETE'))).

-endif.

