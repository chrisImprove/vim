#!/bin/sh
step1="curl -sS https://getcomposer.org/installer | php"
step2="sudo mv composer.phar /usr/local/bin/composer"
step3='composer global require "fxp/composer-asset-plugin:^1.3.1"'


without_composer() {
    echo "Step1 : $step1"
    eval $step1

    echo "Step2 : $step2"
    eval $step2

    echo "Step3 : $step3"
    eval $step3
}

with_composer() {
    read -p "Do you want upgrade the composer program ?   (y/n)" flag
    if [ $flag = "y" ]; then
        composer self-update
    fi

    read -p "1. Please input which folder to install yii2 : " fold

    step4="composer create-project --prefer-dist yiisoft/yii2-app-advanced $fold"

    echo "Step4 : $step4"
    eval $step4
}

program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }

    # fail on non-zero return value
    if [ "$ret" -ne 0 ]; then
        return 1
    fi

    return 0
}


###########          MAIN        ##########
echo "********      This Script is used for Setup YII2      ********"
echo "* note: copy this file to you project dir then run it *"

program_exists "composer"
if [ "$?" -ne 0 ]; then
    without_composer
else
    with_composer
fi



## 安装Composer，如果已经安装过，可不必再安装
## curl -s http://getcomposer.org/installer | php
#
## 对于已经安装过Composer的，可以对其进行更新
#php ../composer.phar self-update
#
## 为Composer 安装 composer asset 插件
#composer global require "fxp/composer-asset-plugin:^1.3.1"
## 使用基础模版安装
## composer create-project --prefer-dist yiisoft/yii2-app-basic digpage.com
