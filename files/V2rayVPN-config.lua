require("luci.sys")

m = Map("V2rayVPN", translate("配置文件"), translate("V2Ray服务器配置, 【通讯协议】默认为ws(websocket),【socks代理端口】开启socks代理，【http代理端口】开启http代理"))

s = m:section(TypedSection, "V2rayVPN", "")
s.addremove = false
s.anonymous = true

enable = s:option(Flag, "enable", translate("开启"))
server = s:option(Value, "server", translate("服务器"))
port = s:option(Value, "port", translate("端口"))
id = s:option(Value, "id", translate("ID"))
protocol = s:option(Value, "protocol", translate("通讯协议，默认ws"))
path = s:option(Value, "path", translate("path(协议参数)"))
socksProxy = s:option(Value, "socksProxy", translate("socks代理端口"))
httpProxy = s:option(Value, "httpProxy", translate("http代理端口"))

local apply = luci.http.formvalue("cbi.apply")
if apply then
    io.popen("/etc/init.d/V2rayVPN restart")
end

return m