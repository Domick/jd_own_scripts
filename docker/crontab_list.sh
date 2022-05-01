# 每3天的23:50分清理一次日志(互助码不清理，proc_file.sh对该文件进行了去重)
50 23 */3 * * find /scripts/logs -name '*.log' | grep -v 'sharecodeCollection' | xargs rm -rf
#收集助力码
30 * * * * sh +x /scripts/docker/auto_help.sh collect >> /scripts/logs/auto_help_collect.log 2>&1

##############短期活动##############
#京东极速版红包(活动时间：2021-5-5至2021-5-31)
10 0,22 * * * node /scripts/jd_speed_redpocke.js >> /scripts/logs/jd_speed_redpocke.log 2>&1

# #超级直播间红包雨(活动时间不定期，出现异常提示请忽略。红包雨期间会正常)
# 1,31 0-23/1 * * * node /scripts/jd_live_redrain.js >> /scripts/logs/jd_live_redrain.log 2>&1

#每日抽奖(活动时间：2021-05-01至2021-05-31)
# 13 1,22,23 * * * node /scripts/jd_daily_lottery.js >> /scripts/logs/jd_daily_lottery.log 2>&1

#金榜创造营 活动时间：2021-05-21至2021-12-31
0 1,22 * * * node /scripts/jd_gold_creator.js >> /scripts/logs/jd_gold_creator.log 2>&1
#5G超级盲盒(活动时间：2021-06-2到2021-07-31)
0 0-23/4 * * * node /scripts/jd_mohe.js >> /scripts/logs/jd_mohe.log 2>&1
#明星小店(星店长，2021-06-10)
# 0 1,21 * * * node /scripts/jd_star_shop.js >> /scripts/logs/jd_star_shop.log 2>&1
#88红包
5 0,6,16 * * * cd /scripts && ts-node jd_88hb.ts >> /scripts/logs/jd_88hb.log 2>&1
#省钱大赢家之翻翻乐
# 10,40 * * * * node /scripts/jd_big_winner.js >> /scripts/logs/jd_big_winner.log 2>&1
##############长期活动##############
#京喜牧场
25 0-23/2 * * * cd /scripts && ts-node jd_jxmc.ts >> /scripts/logs/jd_jxmc.log 2>&1
# 签到
7 0,17 * * * cd /scripts && node jd_bean_sign.js >> /scripts/logs/jd_bean_sign.log 2>&1
# 摇京豆
6 0,23 * * * node /scripts/jd_club_lottery.js >> /scripts/logs/jd_club_lottery.log 2>&1
# 东东农场
15 6-18/6 * * * cd /scripts && ts-node fruit.ts >> /scripts/logs/fruit.log 2>&1
5 6-18/6 * * *  node /scripts/jd_fruit.js >> /scripts/logs/jd_fruit.log 2>&1
# # 宠汪汪邀请助力
# 10 13-20/1 * * * node /scripts/jd_joy_run.js >> /scripts/logs/jd_joy_run.log 2>&1
# 东东萌宠
35 6-18/6 * * * node /scripts/jd_pet.js >> /scripts/logs/jd_pet.log 2>&1
# 京东种豆得豆
10 7-22/1 * * * node /scripts/jd_plantBean.js >> /scripts/logs/jd_plantBean.log 2>&1
# 京东全民开红包
12 0-23/4 * * * node /scripts/jd_redPacket.js >> /scripts/logs/jd_redPacket.log 2>&1
# 进店领豆
# 6 0 * * * node /scripts/jd_shop.js >> /scripts/logs/jd_shop.log 2>&1
# 东东超市
31 0,1-23/2 * * * node /scripts/jd_superMarket.js >> /scripts/logs/jd_superMarket.log 2>&1
# 取关京东店铺商品
45 23 * * * node /scripts/jd_unsubscribe.js >> /scripts/logs/jd_unsubscribe.log 2>&1
# 京豆变动通知
20 10 * * * node /scripts/jd_bean_change.js >> /scripts/logs/jd_bean_change.log 2>&1
# 京东抽奖机
0 0,12,23 * * * node /scripts/jd_lotteryMachine.js >> /scripts/logs/jd_lotteryMachine.log 2>&1
# 京东排行榜
21 9 * * * node /scripts/jd_rankingList.js >> /scripts/logs/jd_rankingList.log 2>&1
# 天天提鹅
0 * * * * node /scripts/jd_daily_egg.js >> /scripts/logs/jd_daily_egg.log 2>&1
# 金融养猪
32 0-23/6 * * * node /scripts/jd_pigPet.js >> /scripts/logs/jd_pigPet.log 2>&1
# 京喜工厂
50 * * * * node /scripts/jd_dreamFactory.js >> /scripts/logs/jd_dreamFactory.log 2>&1
# 东东小窝
46 6,23 * * * node /scripts/jd_small_home.js >> /scripts/logs/jd_small_home.log 2>&1
# 东东工厂
26 * * * * node /scripts/jd_jdfactory.js >> /scripts/logs/jd_jdfactory.log 2>&1
# 赚京豆(微信小程序)
12 * * * * node /scripts/jd_syj.js >> /scripts/logs/jd_syj.log 2>&1
# 京东快递签到
47 1 * * * node /scripts/jd_kd.js >> /scripts/logs/jd_kd.log 2>&1
# 京东汽车(签到满500赛点可兑换500京豆)
# 0 0 * * * node /scripts/jd_car.js >> /scripts/logs/jd_car.log 2>&1
# 领京豆额外奖励(每日可获得3京豆)
23 1,12,22 * * * node /scripts/jd_bean_home.js >> /scripts/logs/jd_bean_home.log 2>&1
# 微信小程序京东赚赚
6 0-5/1,11 * * * node /scripts/jd_jdzz.js >> /scripts/logs/jd_jdzz.log 2>&1
# crazyJoy自动每日任务
30 7,23 * * * node /scripts/jd_crazy_joy.js >> /scripts/logs/jd_crazy_joy.log 2>&1
# 京东汽车旅程赛点兑换金豆
# 0 0 * * * node /scripts/jd_car_exchange.js >> /scripts/logs/jd_car_exchange.log 2>&1
# 导到所有互助码
23 7 * * * node /scripts/jd_get_share_code.js >> /scripts/logs/jd_get_share_code.log 2>&1
# 口袋书店
38 8,12,18 * * * node /scripts/jd_bookshop.js >> /scripts/logs/jd_bookshop.log 2>&1
# 京喜农场
30 9,12,18 * * * node /scripts/jd_jxnc.js >> /scripts/logs/jd_jxnc.log 2>&1
# 签到领现金
10 */4 * * * node /scripts/jd_cash.js >> /scripts/logs/jd_cash.log 2>&1
# 京东秒秒币
10 6,21 * * * node /scripts/jd_ms.js >> /scripts/logs/jd_ms.log 2>&1
#美丽研究院
41 7,12,19 * * * node /scripts/jd_beauty.js >> /scripts/logs/jd_beauty.log 2>&1
#京东保价
#41 0,23 * * * node /scripts/jd_price.js >> /scripts/logs/jd_price.log 2>&1
#京东极速版签到+赚现金任务
21 1,6 * * * cd /scripts && ts-node jd_speed_sign.ts >> /scripts/logs/jd_speed_sign.log 2>&1
0 7,19 * * * node /scripts/jd_speed_coin.js >> /scripts/logs/jd_speed_coin.log 2>&1
#监控crazyJoy分红
10 12 * * * node /scripts/jd_crazy_joy_bonus.js >> /scripts/logs/jd_crazy_joy_bonus.log 2>&1
#京喜财富岛
0 */1 * * * cd /scripts && ts-node jd_cfd.ts >> /scripts/logs/jd_cfd.log 2>&1
# 删除优惠券(默认注释，如需要自己开启，如有误删，已删除的券可以在回收站中还原，慎用)
#20 9 * * 6 node /scripts/jd_delCoupon.js >> /scripts/logs/jd_delCoupon.log 2>&1
#家庭号
10 6,7 * * * node /scripts/jd_family.js >> /scripts/logs/jd_family.log 2>&1
#京东直播（又回来了）
30-50/5 12,23 * * * node /scripts/jd_live.js >> /scripts/logs/jd_live.log 2>&1
#京东健康社区
35 0,6,18 * * * cd /scripts && ts-node jd_health.ts >> /scripts/logs/jd_health.log 2>&1
#京东健康社区收集健康能量
5-45/20 * * * * cd /scripts && ts-node jd_health_collect.ts >> /scripts/logs/jd_health_collect.log 2>&1
# 幸运大转盘
10 10,23 * * * node /scripts/jd_market_lottery.js >> /scripts/logs/jd_market_lottery.log 2>&1
# 领金贴
5 0 * * * node /scripts/jd_jin_tie.js >> /scripts/logs/jd_jin_tie.log 2>&1
# 跳跳乐瓜分京豆
15 0,12,22 * * * node /scripts/jd_jump.js >> /scripts/logs/jd_jump.log 2>&1
# 极速版-发财大赢家
30 */1 * * * cd /scripts && ts-node jd_spped_redEnvelope.ts >> /scripts/logs/jd_spped_redEnvelope.log 2>&1
# 许愿池
10 */1 * * * cd /scripts && ts-node jd_wishingPool.ts >> /scripts/logs/jd_wishingPool.log 2>&1
# 伊利奶牛
20 */1 * * * cd /scripts && ts-node jd_yili_cow.ts >> /scripts/logs/jd_yili_cow.log 2>&1
# joy_park
20 */2 * * * cd /scripts && ts-node jd_joy_park.ts >> /scripts/logs/jd_joy_park.log 2>&1
# joy_qq_pasture
45 */2 * * * cd /scripts && ts-node jd_qq_pasture.ts >> /scripts/logs/jd_qq_pasture.log 2>&1
# 京喜签到
15 0,19 * * * cd /scripts && ts-node jx_sign.ts >> /scripts/logs/jx_sign.log 2>&1
# 京东农场-拓展
30 0,8,13,19 * * * cd /scripts && ts-node jd_fruit_moreTask.ts >> /scripts/logs/jd_fruit_moreTask.log 2>&1
# 京东拼购？
20 0,12,21 * * * cd /scripts && ts-node jd_IndustryLottery.ts >> /scripts/logs/jd_IndustryLottery.log 2>&1
# # 宠汪汪二代 每三小时喂一次
# 0-23/2 * * * * cd /scripts && node jd_joy_new.js >> /scripts/logs/jd_joy_new.log 2>&1
# 宠汪汪兑奖 
0 0,8,16 * * * cd /scripts && ts-node jd_joy_reward.ts >> /scripts/logs/jd_joy_reward.log 2>&1
# 女装盲盒
0 */4 * * * node /scripts/jd_nzmh.js >> /scripts/logs/jd_nzmh.log 2>&1
# 京喜工厂
30 * * * * cd /scripts && ts-node jd_jxgc.ts >> /scripts/logs/jd_jxgc.log 2>&1
# 京喜工厂助力
55 4,8,14 * * * node /scripts/jd_dreamFactory_help.js >> /scripts/logs/jd_dreamFactory_help.log 2>&1
# 手机狂欢城
5 0-18/6 * * * node /scripts/jd_carnivalcity.js >> /scripts/logs/jd_carnivalcity.log 2>&1
# 手机狂欢城
15 0,6 * * * cd /scripts && ts-node jd_carnivalcity_card.ts >> /scripts/logs/jd_carnivalcity_card.log 2>&1
# ddWorld
30 */2 * * * cd /scripts && ts-node jd_ddWorld.ts >> /scripts/logs/jd_ddWorld.log 2>&1
# 京东魔方
22 */4 * * * cd /scripts && ts-node jd_mofang.ts >> /scripts/logs/jd_mofang.log 2>&1
# 京喜牧场-新商品推送
0 * * * * cd /scripts && ts-node jd_jxmc_stock.ts >> /scripts/logs/jd_jxmc_stock.log 2>&1
# 京东快递
10 0 * * * node /scripts/jd_kd.js >> /scripts/logs/jd_kd.log 2>&1
# 京东快递更新通知
0-23/2 * * * * cd /scripts && ts-node jd_track.ts >> /scripts/logs/jd_track.log 2>&1
# 极速版-发财大赢家
# 0 0,8,20 * * * cd /scripts && ts-node jd_speed_redEnvelope.ts >> /scripts/logs/jd_speed_redEnvelope.log 2>&1
# 财富岛热气球挂后台
10 0 * * * cd /scripts && ts-node jd_cfd_balloon.ts >> /scripts/logs/jd_cfd_balloon.log 2>&1
# 财富岛捡贝壳挂后台
# 10 0 * * * cd /scripts && ts-node jd_cfd_shell.ts >> /scripts/logs/jd_cfd_shell.log 2>&1
# 城城领现金
# 0 0-23/1 * * * cd /scripts && ts-node jd_city.ts >> /scripts/logs/jd_city.log 2>&1
# xtg
56 * * * * cd /scripts && ts-node jd_xtg.ts >> /scripts/logs/jd_xtg.log 2>&1
# 京享红包
0 0,12,18 * * * cd /scripts && ts-node jd_jingxianghongbao.ts >> /scripts/logs/jd_jingxianghongbao.log 2>&1
# 领京豆-任务
1 0,9,12,18 * * * cd /scripts && ts-node jd_bean_box.ts >> /scripts/logs/jd_bean_box.log 2>&1
# 京喜-首页-牛牛福利
# 1 0,9,19,23 * * * cd /scripts && ts-node jx_nnfls.ts >> /scripts/logs/jx_nnfls.log 2>&1
# 领京豆额外奖励
10 0,12,22 * * * node jd_bean_home.js >> /scripts/logs/jd_bean_home.log 2>&1
# 京东-下拉
0 9,13,16,19,23 * * * cd /scripts && ts-node jx_homepageTW.ts >> /scripts/logs/jx_homepageTW.log 2>&1
# cfd 100
0 0 * * * node jd_cfd_hb.js >> /scripts/logs/jd_cfd_hb.log 2>&1
# 京东-下拉
15 8,20 * * *  cd /scripts && ts-node jd_tewu.ts >> /scripts/logs/jd_tewu.log 2>&1
# 🐉依赖太旧，更新一下，过几天删
0 0-23/4 * * * cd /scripts && ts-node jd_updatePackage.ts >> /scripts/logs/jd_updatePackage.log 2>&1
# 赚京豆
15,30,45 0 * * * cd /scripts && ts-node jd_zjd_v0.2.ts >> /scripts/logs/jd_zjd_v0.2.log 2>&1
# 发财大赢家助力火爆
# 0 * * * * node jd_facai.js >> /scripts/logs/jd_facai.log 2>&1
# 京喜-88红包-宝箱
5 0,6,12 * * * cd /scripts && ts-node jd_box.ts >> /scripts/logs/jd_box.log 2>&1
# ifanli
30 0,6,12 * * * cd /scripts && ts-node jd_ifanli.ts >> /scripts/logs/jd_ifanli.log 2>&1
# 每周质量报告
0 0 * * 1 cd /scripts && ts-node jd_Last_Week_income.ts >> /scripts/logs/jd_Last_Week_income.log 2>&1
# 宠汪汪三代目
# 0 0-23/3 * * * cd /scripts && ts-node jd_joy_new.ts >> /scripts/logs/jd_joy_new.log 2>&1
# 京喜财富岛-合成游戏
# 30 * * * * cd /scripts && ts-node jd_cfd_game.ts >> /scripts/logs/jd_cfd_game.log 2>&1
# 金榜任务
30 22,18 * * * cd /scripts && ts-node jd_jinbang1.ts >> /scripts/logs/jd_jinbang1.log 2>&1
# 京东-锦鲤红包
# 1 0,6,18 * * * cd /scripts && ts-node jd_jinli_hongbao.ts >> /scripts/logs/jd_jinli_hongbao.log 2>&1
# 金榜任务
0 0,15 * * * cd /scripts && ts-node jd_splitHongbao.ts >> /scripts/logs/jd_splitHongbao.log 2>&1
# 单独收牛牛
0,30 * * * * cd /scripts && ts-node jd_jxmc_getCoin.ts >> /scripts/logs/jd_jxmc_getCoin.log 2>&1
# city2.0
0 0-23/1 * * * cd /scripts && ts-node jd_city1.ts >> /scripts/logs/jd_city1.log 2>&1
# 京东-萌虎摇摇乐
# 0 0,9,16 * * * cd /scripts && ts-node jd_tiger.ts >> /scripts/logs/jd_tiger.log 2>&1
# 京东汽车
15 1 * * * cd /scripts && ts-node jd_car.ts >> /scripts/logs/jd_car.log 2>&1
# 闪购盲盒
20 8 * * * cd /scripts && ts-node jd_sgmh.ts >> /scripts/logs/jd_sgmh.log 2>&1
# 极速版-happyDig
15 0,1,6,18 * * * cd /scripts && ts-node jd_speed_happy_dig.ts >> /scripts/logs/jd_speed_happy_dig.log 2>&1