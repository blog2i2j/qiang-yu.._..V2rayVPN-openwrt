local fs = require "nixio.fs"
local conffile = "/etc/V2rayVPN/V2rayVPN_gfwlist.conf" 

f = SimpleForm("gfwlist", translate("V2rayVPN - gfwlist"), translate("系统自带被封禁的域名列表，点击下面【提交】按钮更新gfwlist列表"))

t = f:field(TextValue, "conf")
t.rmempty = true
t.readonly = true
t.rows = 20
function t.cfgvalue()
	return fs.readfile(conffile) or ""
end

function f.handle(self, state, data)
	if state == FORM_VALID then
		if data.conf then			
			luci.sys.call("/bin/sh  /etc/V2rayVPN/update-gfwlist")
		end
	end
	return true
end

return f
