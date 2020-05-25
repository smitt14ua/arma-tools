class CfgPatches
{
	class st_simple
	{
		units[]={};
		weapons[]={};
		requiredVersion=1;
		requiredAddons[]=
		{
			"3DEN"
		};
	};
};
class CfgFunctions
{
	class st_simple
	{
		class main
		{
			file="st\simple\functions";
			class convertAll;
			class convertBase;
			class convertExcludeSelected;
			class convertSelected;
			class copyToClipboard;
			class copyToClipboardAll;
			class createFromCode;
			class createFromCodeDialog;
			class clearHistory;
			class onLoadCreateFromCode;
		};
	};
};
class ctrlMenu;
class ctrlMenuStrip;
class display3DEN
{
	class ContextMenu: ctrlMenu
	{
		class Items
		{
			items[]+=
			{
				"st_simple_folder"
			};
			class st_simple_folder
			{
				picture="st\common\ui\icon_ca.paa";
				conditionShow="(hoverObject + selectedObject) * (1 - hoverGroup) * (1 - hoverTrigger) * (1 - hoverWaypoint) * (1 - hoverLogic) * (1 - hoverMarker) * (1 - hoverLayer) * (1 - selectedWaypoint) * (1 - selectedLogic) * (1 - selectedMarker)";
				text="$STR_st_simple_contextFolder";
				value=0;
				items[]=
				{
					"st_simple_convertThis",
					"st_simple_convertSelected"
				};
			};
			class st_simple_convertThis
			{
				text="$STR_st_simple_contextThis";
				action="[(uiNamespace getVariable 'bis_fnc_3DENEntityMenu_data') # 1] call st_simple_fnc_convertBase;";
				conditionShow="hoverObject";
			};
			class st_simple_convertSelected
			{
				text="$STR_st_simple_contextSelected";
				action="call st_simple_fnc_convertSelected;";
				conditionShow="selectedObject";
			};
		};
	};
	class Controls
	{
		class MenuStrip: ctrlMenuStrip
		{
			class Items
			{
				class Tools
				{
					items[]+=
					{
						"st_simple_folder"
					};
				};
				class st_simple_folder
				{
					text="$STR_st_simple_folder";
					picture="st\common\ui\icon_ca.paa";
					items[]=
					{
						"st_simple_convertAll",
						"st_simple_convertSelected",
						"st_simple_convertExcludeSelected",
						"Separator",
						"st_simple_copyToClipboard",
						"st_simple_copyToClipboardAll",
						"st_simple_clearHistory",
						"Separator",
						"st_simple_createFromCode"
					};
				};
				class st_simple_convertAll
				{
					text="$STR_st_simple_all";
					action="call st_simple_fnc_convertAll;";
				};
				class st_simple_convertSelected
				{
					text="$STR_st_simple_selected";
					action="call st_simple_fnc_convertSelected;";
				};
				class st_simple_convertExcludeSelected
				{
					text="$STR_st_simple_excludeSelected";
					action="call st_simple_fnc_convertExcludeSelected;";
				};
				class st_simple_copyToClipboard
				{
					text="$STR_st_simple_copyToClipboard";
					action="call st_simple_fnc_copyToClipboard;";
				};
				class st_simple_copyToClipboardAll
				{
					text="$STR_st_simple_copyToClipboardAll";
					action="call st_simple_fnc_copyToClipboardAll;";
				};
				class st_simple_clearHistory
				{
					text="$STR_st_simple_clearHistory";
					action="call st_simple_fnc_clearHistory;";
				};
				class st_simple_createFromCode
				{
					text="$STR_st_simple_createFromCode";
					action="0 spawn {createDialog 'st_simple_CreateFromCode_dialog'};";
				};
			};
		};
	};
};
class IGUIBack;
class RscText;
class RscControlsGroup;
class RscEdit;
class RscButton;
class st_simple_CreateFromCode_Dialog
{
	idd=6500;
	movingEnable=0;
	enableSimulation=0;
	onLoad="_this call st_simple_fnc_onLoadCreateFromCode;";
	class ControlsBackground
	{
		class Background: IGUIBack
		{
			idc=2200;
			x="0.298906 * safezoneW + safezoneX";
			y="0.236 * safezoneH + safezoneY";
			w="0.402187 * safezoneW";
			h="0.528 * safezoneH";
		};
	};
	class Controls
	{
		class TitleText: RscText
		{
			idc=1000;
			text="$STR_st_simple_pasteCodeHere";
			x="0.309219 * safezoneW + safezoneX";
			y="0.258 * safezoneH + safezoneY";
			w="0.381563 * safezoneW";
			h="0.022 * safezoneH";
		};
		class TextareaControlsGroup: RscControlsGroup
		{
			idc=2300;
			x="0.309222 * safezoneW + safezoneX";
			y="0.302 * safezoneH + safezoneY";
			w="0.381563 * safezoneW";
			h="0.385 * safezoneH";
			class Controls
			{
				class Textarea: RscEdit
				{
					idc=1400;
					style="16 + 512";
					colorBackground[]={0,0,0,0.80000001};
					x="0.309219 * safezoneW + safezoneX";
					y="0.302 * safezoneH + safezoneY";
					w="0.381563 * safezoneW";
					h="0.385 * safezoneH";
				};
			};
		};
		class SubmitButton: RscButton
		{
			idc=1600;
			text="$STR_st_simple_create";
			x="0.618594 * safezoneW + safezoneX";
			y="0.709 * safezoneH + safezoneY";
			w="0.0721875 * safezoneW";
			h="0.033 * safezoneH";
		};
		class ErrorText: RscText
		{
			idc=1001;
			text="";
			colorText[]={1,0.30000001,0.30000001,1};
			x="0.309219 * safezoneW + safezoneX";
			y="0.709 * safezoneH + safezoneY";
			w="0.299062 * safezoneW";
			h="0.033 * safezoneH";
		};
	};
};
