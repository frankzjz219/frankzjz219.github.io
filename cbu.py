import os 
os.system("echo cleaning old blogs and generate new ones")
os.system("hexo clean&&echo \\033[34;1m清除缓存中\\033[0m")
os.system("hexo g")
os.system("hexo d||echo \\033[31;1m********NETWORK ERROR***Please Check VPN Connection********\\033[0m")