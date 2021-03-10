if SERVER then	
	AddCSLuaFile("showid/client/showid.lua")
	include("showid/server/showid.lua")
elseif CLIENT then
	include("showid/client/showid.lua")
end