util.AddNetworkString("sendtoserver")
util.AddNetworkString("delinfo")
net.Receive("sendtoserver", function(len,ply)

	sendertable = net.ReadString()
	sendtoplayer = net.ReadEntity()

	net.Start("Sendtoplayer2")
		net.WriteString(sendertable)
		net.WriteEntity(ply)
	net.Send(sendtoplayer)

end)
util.AddNetworkString("Sendtoplayer2")

concommand.Add("del_id", function(ply,cmd,args1,args2)
	for k, v in ipairs( player.GetAll() ) do
    	if(v:SteamID64() == args2) then
    		net.Start("delinfo")
    		net.Send(v)
    		print("Succesfully delted info")
    	break
    end
	end
end)

util.AddNetworkString("OpenID")

hook.Add("PlayerSay", "showid", function( ply, text )
	if string.lower(text) == "/showid" || string.lower(text) == "!showid" then
		net.Start("OpenID")
		net.Send(ply)
	end
end)

util.AddNetworkString("OpenIDConfig")

hook.Add("PlayerSay", "showidconfig", function( ply, text )
	if string.lower(text) == "/showidconfig" || string.lower(text) == "!showidconfig" then
		net.Start("OpenIDConfig")
		net.Send(ply)
	end
end)