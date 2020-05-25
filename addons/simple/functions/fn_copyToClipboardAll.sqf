private _buffer = uiNamespace getVariable ["st_simple_bufferAll", nil];

if (isNil "_buffer") exitWith {
	titleText [
		localize "STR_st_simple_convertHistoryNotFound",
		"PLAIN",
		0.2
	];
};

titleText [
	localize "STR_st_simple_historyHasBeenCopied",
	"PLAIN",
	0.2
];

copyToClipboard _buffer;
