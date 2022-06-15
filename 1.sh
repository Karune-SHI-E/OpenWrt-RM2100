#!/bin/sh
#本脚本用于群友交流，完全开源，可以随意传阅，不过希望保留出处。
echo "==========================================="
echo "       欢迎使用萌新版Hexo控制脚本！"
echo "            双击打开即可使用"
echo "        更多内容可以访问我的博客"
echo "          https://akilar.top"
echo "==========================================="
HexoPath=$(cd "$(dirname "$0")"; pwd)
cd ${HexoPath}
printf "\033[32m Blog 根目录："${HexoPath}"\033[0m"
echo " "
echo "[0] 退出菜单"
echo "=============以下功能需要在空文件夹内使用================"
echo "[1] 从Github拉取最新版本（需要在脚本中配置仓库URL）"
echo "[2] 提交本地修改到GitHub"
echo " "
printf "选择："
read answer


if [ "$answer" = "1" ]; then
printf "\033[32mINFO \033[0m 正在从Github拉取最新版本...\n"
git pull origin main #2020年10月后github新建仓库默认分支改为main，注意更改
printf "\033[32mINFO \033[0m 拉取完毕，您的博客已是最新版本！\n"
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "$answer" = "2" ]; then
printf "\033[32mINFO \033[0m 正在提交最新修改到GitHub...\n"
git add .
git commit -m "Update posts content"
git push -f origin  main #2020年10月后github新建仓库默认分支改为main，注意更改
printf "\033[32mINFO \033[0m 提交完毕，您的修改已上传至Github！\n"
sleep 1s
exec ${HexoPath}/menu.sh



else
if [ "$answer" = "0" ]; then
printf "\033[32mINFO \033[0m 欢迎下次光临！\n"
sleep 1s
exit 0
else
printf "\033[31mERROR \033[0m 输入错误，请返回重新选择...\n"
sleep 1s
exec ${HexoPath}/menu.sh
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi