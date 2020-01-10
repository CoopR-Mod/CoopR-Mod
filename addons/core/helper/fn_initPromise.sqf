#include "script_component.hpp"
////////////////////////////////////////////////////////////////////////////////////
// MIT License                                                                    //
//                                                                                //
// Copyright (c) 2018 Marco Silipo (X39)                                          //
//                                                                                //
// Permission is hereby granted, free of charge, to any person obtaining a copy   //
// of this software and associated documentation files (the "Software"), to deal  //
// in the Software without restriction, including without limitation the rights   //
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell      //
// copies of the Software, and to permit persons to whom the Software is          //
// furnished to do so, subject to the following conditions:                       //
//                                                                                //
// The above copyright notice and this permission notice shall be included in all //
// copies or substantial portions of the Software.                                //
//                                                                                //
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR     //
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,       //
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE    //
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER         //
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  //
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE  //
// SOFTWARE.                                                                      //
////////////////////////////////////////////////////////////////////////////////////


//Variable containing client-requests
Promise_Requests = [];

//Callback for Promise methods
Promise_Callback = {
    params ["_id", "_data"];
    private _request = Promise_Requests select _id;
    Promise_Requests set [_id, 0];
    [_request select 0, _data] call (_request select 1);
};

//Method to create a promise
//param 0 - remoteExec target
//param 1 - either string (methodname) or code
//param 2 - custom arguments to pass to the callback
//param 3 - arguments to pass to the the callback
//param 4 - callback for the promise (executed local, different scope)
//returns - identifier that allows to check for a promise.
Promise_Create = {
    params ["_rcv", "_mthd", "_mthdArgs", "_args", "_cb"];
    private _stamp = diag_tickTime;
    private _index = 0;
    isNil {
        _index = Promise_Requests find 0;
        if (_index == -1) then
        { _index = Promise_Requests pushBack [_args, _cb, _stamp]; }
        else { Promise_Requests set [_index, [_args, _cb, _stamp]]; }
    };
    [_index, _mthd, _mthdArgs] remoteExec ["Promise_Receiver", _rcv, false];
    [_index, _stamp]
};

//Method to check if a promise is done yet
Promise_Done = {
    params ["_index", "_stamp"];
    private _promise = Promise_Requests select _index;
    if (_promise isEqualTo 0) then { true } else { _promise select 2 != _stamp }
};

//Method that will handle a promise
Promise_Receiver = {
    params ["_id", "_mthd", "_args"];
    private _res = if (_mthd isEqualType "") then {
        _args call (missionNamespace getVariable _mthd);
    } else {
        _args call _mthd;
    };
    [_id, _res] remoteExec ["Promise_Callback", remoteExecutedOwner, false];
};


