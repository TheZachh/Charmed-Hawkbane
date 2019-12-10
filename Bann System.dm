proc
	AddBan(key, ip, reason)
		if(key)
			AddKeyBan(key, reason, ip)
		if(ip)
			AddIPBan(ip, reason, key)

	AddKeyBan(key, reason, linked_ip)
		if(!key) return
		var/params[0]
		if(linked_ip) params["reason"] = linked_ip //the "reason" parameter is used becuse it is for internal information
		if(reason) params["desc"] = "You have been banned from [world.name]: [reason]" //"desc" is displayed to the user
		else params["desc"] = "You have been banned from [world.name]."

		world.SetConfig("APP/keyban", key, list2params(params))

	AddIPBan(ip, reason, linked_key)
		if(!ip) return
		var/params[0]
		if(linked_key) params["reason"] = linked_key //the "reason" parameter is used becuse it is for internal information
		if(reason) params["desc"] = "You have been banned from [world.name]: [reason]" //"desc" is displayed to the user
		else params["desc"] = "You have been banned from [world.name]."

		world.SetConfig("APP/ipban", ip, list2params(params))

	RemoveBan(key, ip)
		if(key)
			RemoveKeyBan(key)
		if(ip)
			RemoveIPBan(ip)

	RemoveKeyBan(key)
		if(!key) return
		world.SetConfig("APP/keyban", key, null)
		if(world.GetConfig("keyban", key))
			world.SetConfig("HOME/keyban", key, null)
			world.log << "Warning: Had to remove [key] from HOME-level keyban list"
		if(world.GetConfig("keyban", key))
			world.SetConfig("USER/keyban", key, null)
			world.log << "Warning: Had to remove [key] from USER-level keyban list"
		if(world.GetConfig("keyban", key))
			world.SetConfig("SYSTEM/keyban", key, null)
			world.log << "Warning: Had to remove [key] from SYSTEM-level keyban list"

	RemoveIPBan(ip)
		if(!ip) return
		world.SetConfig("APP/ipban", ip, null)
		if(world.GetConfig("ipban", ip))
			world.SetConfig("HOME/ipban", ip, null)
			world.log << "Warning: Had to remove [ip] from HOME-level ipban list"
		if(world.GetConfig("ipban", ip))
			world.SetConfig("USER/ipban", ip, null)
			world.log << "Warning: Had to remove [ip] from USER-level ipban list"
		if(world.GetConfig("ipban", ip))
			world.SetConfig("SYSTEM/ipban", ip, null)
			world.log << "Warning: Had to remove [ip] from SYSTEM-level ipban list"

	BannedKeyList()
		var/keys = world.GetConfig("keyban")
		for(var/key in keys)
			var/params = world.GetConfig("keyban", key)
			var/params_list[] = params2list(params)
			if(params_list["reason"] == "pager ban") keys -= key
		return keys

	BannedIPList()
		return world.GetConfig("ipban")

	BannedPairList()
		var
			pairs[0]
			keys[] = BannedKeyList()
			ips[] = BannedIPList()
		for(var/ip in ips)
			var/params = world.GetConfig("ipban", ip)
			var/params_list[] = params2list(params)
			if(params_list["reason"] && (params_list["reason"] in keys))
				pairs[ip] = params_list["reason"]
		return pairs