ShowID = ShowID or {}

ShowID.Language = 1 -- 1 = English; 2 = Czech;

----------------------------------------------
--End of Config
----------------------------------------------
function DefineLanguageTable()
	if ShowID.Language == 1 then 
		ShowID.LanguageSet = {
			-- ID
			Text01 = "Name",
			Text02 = "Gun \n License",
			Text03 = "DOB",
			Text04 = "Place of \n birth",
			Text05 = "Job",
			Text06 = "Religion",
			Text07 = "Special \n Marks",
			Text08 = "Close",

			--ID Config
			Text09 = "Day of birth",
			Text10 = "Month of birth",
			Text11 = "Year of birth",
			Text12 = "Place of birth",
			Text13 = "Special Marks",
			Text14 = "Save Config",
			Text15 = "[ID] Wrong syntax.",
			Text16 = "[ID] config saved.",
		}
	elseif ShowID.Language == 2 then
		ShowID.LanguageSet =  {
			-- ID
			Text01 = "Namn",
			Text02 = "Vapen-\nlicens",
			Text03 = "Födels..",
			Text04 = "Födels\neort",
			Text05 = "Jobb",
			Text06 = "Religion",
			Text07 = "Särskild\na märken",
			Text08 = "Stänga",

			--ID Config
			Text09 = "Födelsedag",
			Text10 = "Födelsemånad",
			Text11 = "Födelseår",
			Text12 = "Födelseort",
			Text13 = "Särskilda märken",
			Text14 = "Spara Config",
			Text15 = "[ID] Fel syntax.",
			Text16 = "[ID] konfiguration sparad.",
		}
	end
end