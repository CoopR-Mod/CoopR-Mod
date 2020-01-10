/**
 *	will remove the { & } from the code string (which are applied when using str for example)
 *	call example:
 *	{someCode} call X39_XLib_fnc_convertCodeToString
 *
 *	@ParamsCount 1
 *	@Param1 - CODE/STRING - Code to be converted (if string then function will simply return the string again)
 *	@Return - STRING - Code as string
 *	@Author - X39|Cpt. HM Murdock (original author)
 *	@Author - xetra11 (some tweaks)
 *
 */
params [["_codeToConvert", {}]];

private _codeAsString = str _codeToConvert;
private _codeLength = count _codeAsString;
_codeAsString select [1, _codeLength-2];
