local fs = require "nixio.fs"
local conffile = "/etc/V2rayVPN/config.json" 

f = SimpleForm("配置文件", translate("V2rayVPN - 配置文件"), translate("如果你熟悉配置文件格式，可以直接在这里修改配置文件，1079端口用于数据转发，7070端口用于DNS解析，不要随便改掉"))

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
