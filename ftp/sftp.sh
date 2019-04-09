#!/usr/bin/env bash
set -e
remain_params=""
for ((i = 2; i <= $#; i++)); do
        j=${!i}
        remain_params="$remain_params $j"
done

usualHelp() {
        # cd path                            Change remote directory to 'path'
        # chmod mode path                    Change permissions of file 'path' to 'mode'
        # df [-hi] [path]                    Display statistics for current directory or filesystem containing 'path'
        # get [-afPpRr] remote [local]       Download file
        # mkdir path                         Create remote directory
        # put [-afPpRr] local [remote]       Upload file
        # pwd                                Display remote working directory
        # rename oldpath newpath             Rename remote file
        # rm path                            Delete remote file
        # rmdir path                         Remove remote directory
        :
}

silentPush() {
        sshpass -p ${sftpPassword} sftp -o BatchMode=no -o StrictHostKeyChecking=no -b ${sftpScriptPath} ${sftpUser}@${sftpHost}
}

tty() {
        echo entering interactive sftp...
        sshpass -p ${sftpPassword} sftp ${sftpUser}@${sftpHost}
}
$1 ${remain_params}
