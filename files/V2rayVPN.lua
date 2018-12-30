module("luci.controller.V2rayVPN", package.seeall)

function index()
	if not nixio.fs.access("/etc/V2rayVPN/config.json") then
		return
	end

	entry({"admin", "services", "V2rayVPN"},
		alias("admin", "services", "V2rayVPN", "v2ray"),
		_("V2rayVPN"), 10)

	entry({"admin", "services", "V2rayVPN", "v2ray"},
		cbi("V2rayVPN/V2rayVPN-v2ray"),
		_("V2rayVPN"), 10).leaf = true		
		
	entry({"admin", "services", "V2rayVPN", "config"},
		cbi("V2rayVPN/V2rayVPN-config"),
		_("配置服务"), 20).leaf = true
				
	entry({"admin", "services", "V2rayVPN", "gfwlist"},
		cbi("V2rayVPN/V2rayVPN-gfwlist"),
		_("GFWList"), 30).leaf = true

	entry({"admin", "services", "V2rayVPN", "custom"},
		cbi("V2rayVPN/V2rayVPN-custom"),
		_("自定义域名"), 40).leaf = true
		
	entry({"admin", "services", "V2rayVPN", "ip"},
		cbi("V2rayVPN/V2rayVPN-ip"),
		_("IP直通"), 50).leaf = true			

	entry({"admin", "services", "V2rayVPN", "watchdog"},
		call("action_watchdog"),
		_("Watchdog Log"), 60).leaf = true
end

function action_watchdog()
	local fs = require "nixio.fs"
	local conffile = "/var/log/V2rayVPN-watchdog.log" 
	local watchdog = fs.readfile(conffile) or ""
	luci.template.render("V2rayVPN/watchdog", {watchdog=watchdog})
end
