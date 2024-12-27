for i in $(seq 1 20); do
    # 检查是否有权限设置属性
    if resetprop ro.debuggable 1 2>/dev/null; then
        resetprop ro.debuggable 1
        resetprop service.adb.root 1
        # 使用 magiskpolicy 再次确保规则生效
        magiskpolicy --live "permissive *"
        setprop service.adb.tcp.port 5555
        setprop persist.adb.tcp.port 5555
        pkill -9 adbd
        break
    fi
    sleep 1
done

