local fs = require "nixio.fs"
local conffile = "/etc/V2rayVPN/ip.txt" 

f = SimpleForm("IP直通", translate("IP地址直通"), translate("如果你不知道域名只知道IP，比如游戏服务器IP，填在这里就可以自动翻墙"))

t = f:field(TextValue, "conf")
t.rmempty = true
t.rows = 10
function t.cfgvalue()
	return fs.readfile(conffile) or ""
end

function f.handle(self, state, data)
	if state == FORM_VALID then
		if data.conf then
			fs.writefile(conffile, data.conf:gsub("\r\n", "\n"))
			luci.sys.call("/etc/init.d/V2rayVPN restart")
		end
	end
	return true
end

return f
