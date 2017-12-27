#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_dictGetValueByKey.sqf
 *
 * Parameter(s):
 *     0: NAMESPACE - Namespace dict is stored in§
 *     1: STRING    - Name of dict
 *     2: STRING    - Key of value to get
 *
 * Returns:
 *     ANYTHING - Value of key
 *
 * Throws:
 *
 * Description:
 *     Gets value of a dict key element
 */
scriptName "GW_client_fnc_dictGetValueByKey: main";
scopeName "main";

params [["_namespace", missionNamespace, [missionNamespace]], ["_dictName", "", [""]], ["_key", "", [""]]];

// Error checks
if (_dictName isEqualTo "") throw "Dictname is empty string";
if (_key isEqualTo "") throw "Key is empty string";

// Get dict array
private _dict = _namespace getVariable _dictName;
if (isNil "_dict") throw "No dict with that name exists";

// Loop through the dict array
{
    _x params ["_elementKey", "_elementValue"];

    // If found, return
    if (_elementKey == _key) exitWith {
        _elementValue breakOut "main";
    };
} count _dict;

// Return nothing
nil;