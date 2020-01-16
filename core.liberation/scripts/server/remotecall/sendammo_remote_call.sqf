if (!isServer) exitWith {};
params ["_src", "_dst_id", "_ammo"];
private ["_dst", "_src_ammo", "_dst_ammo"];

_dst = (allPlayers select {alive _x && getPlayerUID _x == _dst_id}) select 0;
if (isNil "_dst" ) exitWith {};
if (!isPlayer _src || !isPlayer _dst || _src == _dst) exitWith {};

_src_ammo = _src getVariable ["GREUH_ammo_count",0];
if (_src_ammo < _ammo) exitWith {};
_text = format ["Send %1 AMMO to %2", _ammo, name _dst];
_src setVariable ["GREUH_ammo_count", (_src_ammo - _ammo), true];
[gamelogic, _text] remoteExec ["globalChat", owner _src];

_dst_ammo = _dst getVariable ["GREUH_ammo_count",0];
_text = format ["Recv %1 AMMO from %2", _ammo, name _src];
_dst setVariable ["GREUH_ammo_count", (_dst_ammo + _ammo), true];
[gamelogic, _text] remoteExec ["globalChat", owner _dst];
