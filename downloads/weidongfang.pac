function FindProxyForURL(url, host){
	return "PROXY 10.14.146.138:8888; SOCKS 10.14.146.138:8888";
	if (host.search('speiyou.cn') != -1 || host.search('speiyou.com') != -1) {
		return "PROXY 10.14.146.138:8888; SOCKS 10.14.146.138:8888";
	}
    return "DIRECT";
}