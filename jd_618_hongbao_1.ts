/**
 * 20ç¹å¼å¥çð§§
 * cron: 10 20,21,22 * * *
 */

import axios from 'axios'
import USER_AGENT, {getCookie, getshareCodeHW, o2s, wait} from './TS_USER_AGENTS'
import {Log_618} from "./utils/log_618"

let cookie: string = '', res: any = '', UserName: string, index: number, log: { log: string, random: string }, secretp: string = ''
let shareCodeHW: string[] = [], shareCodeSelf: string  [] = [], shareCode: string[] = []

!(async () => {
  if (new Date().getHours() < 20) {
    console.log('20ç¹å¼å§')
    process.exit(0)
  }
  let cookiesArr: string[] = await getCookie()
  let tool: Log_618 = new Log_618()

  for (let i = 0; i < cookiesArr.length; i++) {
    try {
      cookie = cookiesArr[i]
      UserName = decodeURIComponent(cookie.match(/pt_pin=([^;]*)/)![1])
      index = i + 1
      console.log(`\nå¼å§ãäº¬ä¸è´¦å·${index}ã${UserName}\n`)

      res = await api('promote_getHomeData', {})
      secretp = res.data.result.homeMainInfo.secretp
      res = await api('promote_pk_getAmountForecast', {})

      if (!res.data.result?.userAward) {
        console.log('ç»éå¤±è´¥')
        continue
      }
      console.log('ð§§', parseFloat(res.data.result.userAward))

      log = await tool.main()
      await wait(4000)

      res = await api('promote_pk_getExpandDetail', {"ss": JSON.stringify({extraData: {log: encodeURIComponent(log.log), sceneid: 'RAhomePageh5'}, secretp: secretp, random: log.random})})
      console.log('å©åç ', res.data.result.inviteId)
      console.log('æ¶å°å©å', res.data.result.taskVos[0].assistTaskDetailVo.assistInfoVos.length)
      shareCodeSelf.push(res.data.result.inviteId)
    } catch (e) {
    } finally {
      await wait(2000)
    }
  }

  console.log('åé¨äºå©')
  o2s(shareCodeSelf)

  for (let i = 0; i < cookiesArr.length; i++) {
    try {
      cookie = cookiesArr[i]
      UserName = decodeURIComponent(cookie.match(/pt_pin=([^;]*)/)![1])
      index = i + 1
      console.log(`\nå¼å§ãäº¬ä¸è´¦å·${index}ã${UserName}\n`)
      res = await api('promote_getHomeData', {})
      secretp = res.data.result.homeMainInfo.secretp

      if (shareCodeHW.length === 0) {
        shareCodeHW = await getshareCodeHW('lyb_pz')
      }
      if (i === 0) {
        shareCode = Array.from(new Set([...shareCodeHW, ...shareCodeSelf]))
      } else {
        shareCode = Array.from(new Set([...shareCodeSelf, ...shareCodeHW]))
      }
      for (let code of shareCode) {
        console.log('å»å©å', code)
        log = await tool.main()
        res = await api('promote_pk_collectPkExpandScore', {"ss": JSON.stringify({extraData: {log: encodeURIComponent(log.log), sceneid: 'RAhomePageh5'}, secretp: secretp, random: log.random}), "actionType": "0", "inviteId": code})
        console.log(res.data.bizMsg)
        await wait(4000)
      }
    } catch (e) {
      console.log('error', e)
    } finally {
      await wait(1000)
    }
  }
})()

async function api(fn: string, body: object) {
  let appid: string = fn.includes('promote_') ? 'signed_wh5' : 'wh5'
  let {data} = await axios.post(`https://api.m.jd.com/client.action?functionId=${fn}`, `functionId=${fn}&client=m&clientVersion=1.0.0&appid=${appid}&body=${JSON.stringify(body)}`, {
    headers: {
      'Host': 'api.m.jd.com',
      'Origin': 'https://wbbny.m.jd.com',
      'Accept': 'application/json, text/plain, */*',
      'User-Agent': USER_AGENT,
      'Referer': 'https://wbbny.m.jd.com/',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie': cookie
    }
  })
  return data
}