local Scrw, Scrh = ScrW(),ScrH()

surface.CreateFont("ShowID24", {font = "Alte Schwabacher",    size = Scrw*0.0125,     weight = 500})
surface.CreateFont("ShowID20", {font = "Alte Schwabacher",    size = Scrw*0.0105,     weight = 500})

hook.Add( "OnScreenSizeChanged", "PrintOld", function( oldWidth, oldHeight )
	Scrw, Scrh = ScrW(),ScrH()
	surface.CreateFont("ShowID24", {font = "Alte Schwabacher",    size = Scrw*0.0125,     weight = 500})
	surface.CreateFont("ShowID20", {font = "Alte Schwabacher",    size = Scrw*0.0105,     weight = 500})
end )

local faded_black = Color(0, 0, 0, 200)		-- The color black but with 200 Alpha
local Black = Color(0,0,0)
local White = Color(255,255,255)
local ply
local Player_Table_Import

local function readtable()
		if(file.Exists("showid/"..ply:Name()..".txt","DATA") == true) then
			Player_Table_Import = util.JSONToTable(file.Read("showid/"..ply:Name()..".txt","DATA"))
	end
end

hook.Add( "Initialize", "some_unique_name", function()
	MsgC(Color(66, 139, 202), "[ShowID] ", Color(210, 210, 210), "Loaded ShowID by ","Lukyspore ","(STEAM_0:1:45109369)\n")
end )


local function showid()
	readtable()
local DFrame = vgui.Create( "DFrame" ) -- The name of the panel we don't have to parent it
DFrame:SetSize((Scrw* 0.79)/2, (Scrh*0.98)/2)               -- Set the size to 300x by 200y
DFrame:SetPos(Scrw/2 - (Scrw* 0.79/4), Scrh/2 - (Scrh*0.98/4))
DFrame:MakePopup()                     -- Makes your mouse be able to move around
DFrame:SetDraggable(false)
DFrame:ShowCloseButton( false )

sound.PlayFile( "sound/showid/open_book.mp3", "noplay", function( station, errCode, errStr )
	if ( IsValid( station ) ) then
		station:Play()
	end
end )

	local img_construct = vgui.Create("DImage", DFrame)
	img_construct:SetSize((Scrw* 0.79)/2, (Scrh*0.98)/2)		
	img_construct:SetImage("materials/id/german_id.png")

	---------------------------------------------------
	--General labels--
	---------------------------------------------------

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.028, Scrh * 0.08 )
	DLabel:SetText( "Name" )
	DLabel:SetFont("ShowID24")

		local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.028, Scrh * 0.12 )
	DLabel:SetText( "Gun \n License" )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.028, Scrh * 0.1525 )
	DLabel:SetText( "DOB" )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.028, Scrh * 0.185 )
	DLabel:SetText( "Place of \n birth" )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.028, Scrh * 0.215 )
	DLabel:SetText( "Job" )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.028, Scrh * 0.25 )
	DLabel:SetText( "Religion" )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.028, Scrh * 0.29 )
	DLabel:SetText( "Special \n Marks" )
	DLabel:SetFont("ShowID24")

	local DermaButton = vgui.Create( "DButton", DFrame ) // Create the button and parent it to the frame
	DermaButton:SetText( "Close" )					// Set the text on the button
	DermaButton:SetPos( Scrw * 0.345, Scrh * 0 )					// Set the position on the frame
	DermaButton:SetSize( Scrw * 0.05, Scrw * 0.015 )					// Set the size
	DermaButton:SetTextColor( White )
	DermaButton:SetFont("ShowID20")
	DermaButton.DoClick = function()				// A custom function run when clicked ( note the . instead of : )
	DFrame:Close()
	end
	DermaButton.Paint = function() -- The paint function
    surface.SetDrawColor( 139,0,0, 150 ) -- What color do You want to paint the button (R, B, G, A)
    surface.DrawRect( 0, 0, DermaButton:GetWide(), DermaButton:GetTall() ) -- Paint what coords (Used a function to figure that out)
	end
	---------------------------------------------------
	--Custom labels--
	---------------------------------------------------
	local haslicense
	if(ply:getDarkRPVar("HasGunlicense") == true)then
		haslicense = "Yes"
	else haslicense = "No" end

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.08, Scrh * 0.08 )
	DLabel:SetText( ply:Name() )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.08, Scrh * 0.12 )
	DLabel:SetText( haslicense )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.08, Scrh * 0.215 )
	DLabel:SetText( ply:getDarkRPVar("job") )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.08, Scrh * 0.1525 )
	DLabel:SetText( Player_Table_Import.DOB )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.08, Scrh * 0.185 )
	DLabel:SetText( Player_Table_Import.POB )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.08, Scrh * 0.25 )
	DLabel:SetText( Player_Table_Import.Religion )
	DLabel:SetFont("ShowID24")

		local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.08, Scrh * 0.29 )
	DLabel:SetText( Player_Table_Import.SpecialMarks )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.08, Scrh * 0.29 )
	DLabel:SetText( Player_Table_Import.SpecialMarks )
	DLabel:SetFont("ShowID24")


	local icon = vgui.Create( "DModelPanel", DFrame )
	icon:SetSize(Scrw * 0.1,Scrh * 0.23)
	icon:SetPos(Scrw * 0.2,Scrh * 0.02)	
	icon:SetFOV( 30 )
	icon:SetCamPos( Vector(120,0,50) )
	icon:SetModel( ply:GetModel() ) -- you can only change colors on playermodels
	function icon:LayoutEntity( Entity ) return end -- disables default rotation
	function icon.Entity:GetPlayerColor() return Vector (0, 0, 0) end --we need to set it to a Vector not a Color, so the values are normal RGB values divided by 255.

	local ShootPos = LocalPlayer():GetShootPos()
	local AimVector = LocalPlayer():GetAimVector()


	for k, plys in pairs(player.GetAll()) do
		if plys == LocalPlayer() or not plys:Alive() or plys:GetNoDraw() then continue end
		local PlyShootPos = plys:GetShootPos()

		if PlyShootPos:DistToSqr(ShootPos) < 104000 then
			local Pos = PlyShootPos - ShootPos
			local Units = Pos:GetNormalized()

			if Units:Dot(AimVector) > 0.95 then
				local Trace = util.QuickTrace(ShootPos, Pos, LocalPlayer())

				if Trace.Hit and Trace.Entity ~= plys then return end
				print("im here")
				local Player_Table_ToSend = file.Read("showid/"..ply:Name()..".txt","DATA")
				net.Start("sendtoserver")
					net.WriteString(Player_Table_ToSend)
					net.WriteEntity(plys)
				net.SendToServer()


			end
		end
	end
end

local function createdir()
	if(file.Exists("showid", "DATA") == false) then
		file.CreateDir("showid")
	end

	if(file.Exists("showid/"..ply:Name()..".txt","DATA") == false) then
		math.randomseed(os.time())
		local dob_num_day = math.random(1,31)
		local dob_num_month = math.random(1,12)
		local dob_num_year = math.random(0,24)
		local pob_num = math.random(1,22)

		if dob_num_year < 10 then
			dob_num_year = "0"..dob_num_year
		end

		pob_table = {
			"Berlin",
			"München",
			"Nürnberg",
			"Prague",
			"Frankfurt am Main",
			"Köln",
			"Düsseldorf",
			"Hamburg",
			"Dresden",
			"Kiel",
			"Salzburg",
			"Wien",
			"Innsbruck",
			"Klagenfurt am Wörthersee",
			"Villach",
			"Linz",
			"Stuttgart",
			"Wolfsburg",
			"Wilhelmshaven",
			"Bremen",
			"Münster",
			"Leipzig",
		}

		Player_Table = {
	DOB = dob_num_day.."."..dob_num_month..".19"..dob_num_year,
	POB = pob_table[pob_num],
	Religion = "None",
	SpecialMarks = "None",
	}
	local tabletowrite = util.TableToJSON(Player_Table)
		file.Write("showid/"..ply:Name()..".txt",tabletowrite)
	end
end

local function showidconfig()
	local DFrame = vgui.Create( "DFrame" ) -- The name of the panel we don't have to parent it
	DFrame:SetPos( Scrw/2 - (Scrw * 0.16) /2, Scrh/2 - (Scrh * 0.42) /2)
	DFrame:SetSize(Scrw * 0.16, Scrh * 0.42)               -- Set the size to 300x by 200y
	DFrame:SetTitle("ShowID Config")         -- Set the title in the top left to 'Derma Frame'
	DFrame:MakePopup()                     -- Makes your mouse be able to move around
	DFrame:SetDraggable(false)
	DFrame.Paint = function(self, w, h)		-- Paint function w, h = how wide and tall it is
	draw.RoundedBox(2, 0, 0, w, h, faded_black)	-- Draws a rounded box with the color faded_black stored abouve
	end

	local TextEntry1 = vgui.Create( "DTextEntry", DFrame ) -- create the form as a child of frame
	TextEntry1:SetPos(  Scrw * 0.013, Scrh * 0.05 )
	TextEntry1:SetSize( Scrw * 0.13/3, Scrh * 0.05 )
		TextEntry1:SetFont("ShowID20")
	TextEntry1:SetNumeric( true )
	TextEntry1:SetPlaceholderText( "Day of birth" )

		local TextEntry5 = vgui.Create( "DTextEntry", DFrame ) -- create the form as a child of frame
	TextEntry5:SetPos(  Scrw * 0.0555, Scrh * 0.05 )
	TextEntry5:SetSize( Scrw * 0.13/3, Scrh * 0.05 )
		TextEntry5:SetFont("ShowID20")
	TextEntry5:SetNumeric( true )
	TextEntry5:SetPlaceholderText( "month of birth" )

			local TextEntry6 = vgui.Create( "DTextEntry", DFrame ) -- create the form as a child of frame
	TextEntry6:SetPos(  Scrw * 0.0975, Scrh * 0.05 )
	TextEntry6:SetSize( Scrw * 0.13/3, Scrh * 0.05 )
		TextEntry6:SetFont("ShowID20")
	TextEntry6:SetNumeric( true )
	TextEntry6:SetPlaceholderText( "Year of birth" )



	local TextEntry2 = vgui.Create( "DTextEntry", DFrame ) -- create the form as a child of frame
	TextEntry2:SetPos(  Scrw * 0.013, Scrh * 0.13 )
	TextEntry2:SetSize( Scrw * 0.13, Scrh * 0.05 )
		TextEntry2:SetFont("ShowID20")
	TextEntry2:SetPlaceholderText( "Place of birth" )


	local TextEntry3 = vgui.Create( "DTextEntry", DFrame ) -- create the form as a child of frame
	TextEntry3:SetPos(  Scrw * 0.013, Scrh * 0.21 )
	TextEntry3:SetSize( Scrw * 0.13, Scrh * 0.05 )
		TextEntry3:SetFont("ShowID20")
	TextEntry3:SetPlaceholderText( "Religion" )


	local TextEntry4 = vgui.Create( "DTextEntry", DFrame ) -- create the form as a child of frame
	TextEntry4:SetPos(  Scrw * 0.013, Scrh * 0.29 )
	TextEntry4:SetSize( Scrw * 0.13, Scrh * 0.05 )
		TextEntry4:SetFont("ShowID20")
	TextEntry4:SetPlaceholderText( "Special Marks" )


	local DermaButton = vgui.Create( "DButton", DFrame )
	DermaButton:SetText( "Save Config" )
	DermaButton:SetPos( Scrw * 0.013, Scrh * 0.35 )
		DermaButton:SetFont("ShowID20")
	DermaButton:SetSize( Scrw * 0.13, Scrh * 0.05 )
	DermaButton.DoClick = function()
		if(TextEntry1:GetValue() == "" || TextEntry2:GetValue() == "" || TextEntry3:GetValue() == "" || TextEntry4:GetValue() == "" || TextEntry5:GetValue() == "" || TextEntry6:GetValue() == "") then ply:PrintMessage( HUD_PRINTTALK, "[ID] Wrong syntax." ) return end
				local dob_day = math.Clamp(TextEntry1:GetValue(),1,31)
	local dob_month = math.Clamp(TextEntry5:GetValue(),1,12)
	local dob_year = math.Clamp(TextEntry6:GetValue(),1844,1943)
		DFrame:Close()
		ply:PrintMessage( HUD_PRINTTALK, "ID config saved." )
		local tabletosavenotjson = {
		DOB = dob_day.."."..dob_month.."."..dob_year,
		POB = TextEntry2:GetValue(),
		Religion = TextEntry3:GetValue(),
		SpecialMarks = TextEntry4:GetValue(),
		}
		local tabletosavejson = util.TableToJSON(tabletosavenotjson)
		file.Write("showid/"..ply:Name()..".txt", tabletosavejson)
	end
end

net.Receive("Sendtoplayer2", function()
	local senderTable = net.ReadString()
	local senderentity = net.ReadEntity()
	local senderTableJSON = util.JSONToTable(senderTable)

	sound.PlayFile( "sound/showid/open_book.mp3", "noplay", function( station, errCode, errStr )
	if ( IsValid( station ) ) then
		station:Play()
	end
end )

	local DFrame = vgui.Create( "DFrame" ) -- The name of the panel we don't have to parent it
DFrame:SetSize(1517 /2, 1060 /2)               -- Set the size to 300x by 200y
DFrame:SetPos(Scrw/2 - 1517 /4, Scrh/2 - 1060 /4)
DFrame:MakePopup()                     -- Makes your mouse be able to move around
DFrame:SetDraggable(false)

	local img_construct = vgui.Create("DImage", DFrame)
	img_construct:SetSize(1517 /2, 1060 /2)		
	img_construct:SetImage("materials/id/german_id.png")

	---------------------------------------------------
	--General labels--
	---------------------------------------------------

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.028, Scrh * 0.08 )
	DLabel:SetText( "Name" )
	DLabel:SetFont("ShowID24")

		local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.028, Scrh * 0.12 )
	DLabel:SetText( "Gun \n License" )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.028, Scrh * 0.1525 )
	DLabel:SetText( "DOB" )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.028, Scrh * 0.185 )
	DLabel:SetText( "Place of \n birth" )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.028, Scrh * 0.215 )
	DLabel:SetText( "Job" )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.028, Scrh * 0.25 )
	DLabel:SetText( "Religion" )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.028, Scrh * 0.29 )
	DLabel:SetText( "Special \n Marks" )
	DLabel:SetFont("ShowID24")

	local DermaButton = vgui.Create( "DButton", DFrame ) // Create the button and parent it to the frame
	DermaButton:SetText( "Close" )					// Set the text on the button
	DermaButton:SetPos( Scrw * 0.345, Scrh * 0 )					// Set the position on the frame
	DermaButton:SetSize( Scrw * 0.05, Scrw * 0.015 )					// Set the size
	DermaButton:SetTextColor( White )
	DermaButton:SetFont("ShowID20")
	DermaButton.DoClick = function()				// A custom function run when clicked ( note the . instead of : )
	DFrame:Close()
	end
	DermaButton.Paint = function() -- The paint function
    surface.SetDrawColor( 139,0,0, 150 ) -- What color do You want to paint the button (R, B, G, A)
    surface.DrawRect( 0, 0, DermaButton:GetWide(), DermaButton:GetTall() ) -- Paint what coords (Used a function to figure that out)
	end

	---------------------------------------------------
	--Custom labels--
	---------------------------------------------------

		local haslicense
	if(senderentity:getDarkRPVar("HasGunlicense") == true)then
		haslicense = "Yes"
	else haslicense = "No" end

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.08, Scrh * 0.08 )
	DLabel:SetText( senderentity:Name() )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.08, Scrh * 0.12 )
	DLabel:SetText( haslicense )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.08, Scrh * 0.215 )
	DLabel:SetText( senderentity:getDarkRPVar("job") )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.08, Scrh * 0.1525 )
	DLabel:SetText( senderTableJSON.DOB )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.08, Scrh * 0.185 )
	DLabel:SetText( senderTableJSON.POB )
	DLabel:SetFont("ShowID24")

	local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.08, Scrh * 0.25 )
	DLabel:SetText( senderTableJSON.Religion )
	DLabel:SetFont("ShowID24")

		local DLabel = vgui.Create( "DLabel", DFrame )
	DLabel:SetTextColor(Black)
	DLabel:SetSize( Scrw * 0.1, Scrh * 0.094 )
	DLabel:SetPos( Scrw * 0.08, Scrh * 0.29 )
	DLabel:SetText( senderTableJSON.SpecialMarks )
	DLabel:SetFont("ShowID24")


	local icon = vgui.Create( "DModelPanel", DFrame )
	icon:SetSize(Scrw * 0.1,Scrh * 0.23)
	icon:SetPos(Scrw * 0.2,Scrh * 0.02)	
	icon:SetFOV( 30 )
	icon:SetCamPos( Vector(120,0,50) )
	icon:SetModel( senderentity:GetModel() ) -- you can only change colors on playermodels
	function icon:LayoutEntity( Entity ) return end -- disables default rotation
	function icon.Entity:GetPlayerColor() return Vector (0, 0, 0) end --we need to set it to a Vector not a Color, so the values are normal RGB values divided by 255.

end)

net.Receive("delinfo", function()
	ply = LocalPlayer()
	file.Delete("showid/"..ply:Name()..".txt")
end)

net.Receive("OpenID", function()
	ply = LocalPlayer()
		createdir()
		showid()
end)

net.Receive("OpenIDConfig", function()
	ply = LocalPlayer()
		showidconfig()
end)