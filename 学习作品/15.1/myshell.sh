#!/bin/bash
echo "shell successed";pm2 start  bin/www;
# ����ѭ��
while true
do
		# ��ȡ�ڴ��У�����www�ַ���������grep�ַ����е����е�ֵ
        j=$(ps aux|grep www|grep -v 'grep'|awk '{print $3}');
        # ���2��
        sleep 2;
        # ��ʾj��ֵ
        echo "-------------j is $j -------------------";
        # �跧ֵΪ0.2
        f=0.2
        # �ȶԣ�j>f���0����֮���1
        # shell�ﲻ��ֱ������С��������ͨ�����������ܡ�
        val=$(expr $j \> $f)
        echo $val
        # if�����βҪ��fi ���������鶼Ҫ�пո����ݲ��ܼӡ���
        if [ $val -eq 0 ]
        	then
        		pm2 reload bin/www;
        	else
        		echo "safe";
        fi		
done;