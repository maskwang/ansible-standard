<?php

        $qqwry_sock = "/tmp/qqwry.sock";
        $socket = @socket_create(AF_UNIX, SOCK_STREAM, 0);
        if (!$socket) {
            return FALSE;
        }
        $ret = @socket_connect($socket, $qqwry_sock);
        if (!$ret) {
            return FALSE;
        }
        $ret = @socket_write($socket, "202.96.209.133\n");
        if (!$ret) {
            @socket_close($socket);
            return FALSE;
        }
        $ret = @socket_read($socket, 256);
        @socket_close($socket);
        if (!$ret) {
            return FALSE;
        }

        // python return gbk?
        // $ret = @iconv("GBK", "UTF-8", $ret);
        if (!$ret) {
            return FALSE;
        }
