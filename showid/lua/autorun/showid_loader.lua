if SERVER then	
	AddCSLuaFile("showid/client/showid.lua")
	AddCSLuaFile("showid/cl_config.lua")
	include("showid/server/showid.lua")
elseif CLIENT then
	include("showid/cl_config.lua")
	include("showid/client/showid.lua")
end