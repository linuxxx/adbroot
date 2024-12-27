sleep 20

resetprop ro.debuggable 1

setprop service.adb.tcp.port 5555
setprop persist.adb.tcp.port 5555
setprop persist.tcpip.enable 1
setprop persist.adb.tcp.enable 1

magiskpolicy --live 'allow adbd adbd process setcurrent'
magiskpolicy --live 'allow adbd su process dyntransition'

magiskpolicy --live 'allow adbd node_type:tcp_socket node_bind'
magiskpolicy --live 'allow adbd port:tcp_socket name_bind'
magiskpolicy --live 'allow adbd self:tcp_socket { create bind accept listen read write getopt setopt }'
magiskpolicy --live 'allow adbd node_type:tcp_socket node_connect'
magiskpolicy --live 'allow adbd port:tcp_socket name_connect'
magiskpolicy --live 'allow adbd self:capability { net_raw net_admin }'
magiskpolicy --live 'allow adbd self:netlink_route_socket { create read write nlmsg_read setopt bind getattr }'
magiskpolicy --live 'allow adbd node_type:{ tcp_socket udp_socket } node_bind'

magiskpolicy --live 'allow adbd self:udp_socket { create bind connect read write setopt getopt }'
magiskpolicy --live 'allow adbd self:netlink_socket { create bind connect read write setopt getopt }'
magiskpolicy --live 'allow adbd self:packet_socket { create bind connect read write setopt getopt }'
magiskpolicy --live 'allow adbd node_type:{ tcp_socket udp_socket } *'
magiskpolicy --live 'allow adbd port_type:{ tcp_socket udp_socket } *'
magiskpolicy --live 'allow adbd self:netlink_kobject_uevent_socket { create bind connect read write setopt getopt }'
magiskpolicy --live 'allow adbd self:netlink_route_socket { create bind connect read write setopt getopt nlmsg_read nlmsg_write }'
magiskpolicy --live 'allow adbd self:netlink_generic_socket { create bind connect read write setopt getopt }'

magiskpolicy --live 'allow netd adbd unix_stream_socket { read write }'
magiskpolicy --live 'allow netd adbd tcp_socket { read write }'
magiskpolicy --live 'allow netd adbd udp_socket { read write }'
magiskpolicy --live 'allow netd adbd netlink_socket { read write }'
magiskpolicy --live 'allow netd * tcp_socket { create bind setopt }'
magiskpolicy --live 'allow netd * udp_socket { create bind setopt }'

magiskpolicy --live 'allow adbd * * *'
magiskpolicy --live 'allow su * * *'
magiskpolicy --live 'permissive { su }'
magiskpolicy --live 'permissive { adbd }'
magiskpolicy --live 'permissive { system_server }'
magiskpolicy --live 'permissive { netd }'

stop adbd
sleep 2
start adbd
sleep 2



