private _buffer = uiNamespace getVariable ["st_simple_buffer", nil];

if (isNil "_buffer") exitWith {
	titleText [
		localize "STR_st_simple_lastConvertNotFound",
		"PLAIN",
		0.2
	];
};

titleText [
	localize "STR_st_simple_lastConvertHasBeenCopied",
	"PLAIN",
	0.2
];

copyToClipboard _buffer;
