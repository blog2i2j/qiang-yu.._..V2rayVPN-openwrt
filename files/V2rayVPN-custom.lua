local fs = require "nixio.fs"
local conffile = "/etc/V2rayVPN/V2rayVPN-custom.conf" 

f = SimpleForm("自定义域名", translate("V2rayVPN - 自定义域名"), translate("在这里填写上你要翻墙的域名，按照下面格式写"))

t = f:field(TextValue, "conf")
t.rmempty = true
t.rows = 20
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
