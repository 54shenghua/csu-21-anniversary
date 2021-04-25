import hashlib
import json
import time
import uuid
import urllib.parse

import requests
from django.http import JsonResponse, HttpResponse

# Create your views here.
from api.models import User, Record, Campus, Event

APPID = 'wx2fdfc27744ffa252'
APPSECRET = '9da819bd0531b325f5ebda4f85a92503'
jsapi_ticket = ''
now_time = 0


# 微信登录
def login(request):
    if request.method == 'POST':
        received_json_data = json.loads(request.body)
        code = received_json_data['code']
        print(code)
        params = {
            'appid': APPID,
            'secret': APPSECRET,
            'code': code,
            'grant_type': 'authorization_code'
        }
        url = 'https://api.weixin.qq.com/sns/oauth2/access_token'
        response = requests.get(url=url, params=params)
        json_str = response.content.decode()
        tokenInfo = json.loads(json_str, strict=False)
        if 'errcode' in tokenInfo:
            return HttpResponse(str(tokenInfo["errcode"]) + ' ' + tokenInfo["errmsg"])
        else:
            openID = tokenInfo['openid']
            access_token = tokenInfo['access_token']
            next_url = 'https://api.weixin.qq.com/sns/userinfo'
            next_params = {
                'access_token': access_token,
                'openid': openID
            }
            users = User.objects.filter(openid=openID)
            if users:
                user = users.first()
                avatar = user.avatar
                province = user.province
                sex = user.sex
                city = user.city
                country = user.country
                return JsonResponse({'data': {'openid': openID, 'avatar': avatar}, 'msg': '', 'status': 200})
            else:
                next_response = requests.get(url=next_url, params=next_params)
                user_str = next_response.content.decode()
                user_info = json.loads(user_str)
                if 'errcode' in user_info:
                    return HttpResponse('网络请求出错')
                else:
                    avatar = user_info['headimgurl']
                    province = user_info['province']
                    sex = user_info['sex']
                    city = user_info['city']
                    country = user_info['country']
                    user = User.objects.create(openid=openID, avatar=avatar, province=province, sex=sex,
                                               city=city, country=country)
                    user.save()
                    return JsonResponse({'data': {'openid': openID, 'avatar': avatar, }, 'msg': '', 'status': 200})


def test(request):
    User.objects.create(avatar='hhh')
    return JsonResponse({'msg': 'ok'})


def click(request):
    if request.method == 'POST':
        received_json_data = json.loads(request.body)
        openid = received_json_data['openid']
        name = received_json_data['name']
        time = received_json_data['time']
        campus = received_json_data['campus']
        moment = received_json_data['moment']
        users = User.objects.filter(openid=openid)
        if not users:
            return JsonResponse({'msg': 'failed'})
        else:
            campus_str = ''
            for i in range(len(campus)):
                campus_data = Campus.objects.get(campusID=campus[i])
                campus_data.click += 1
                campus_data.save()
                campus_str += str(campus[i]).zfill(2)

            moment_str = ''
            for i in range(len(moment)):
                moment_data = Event.objects.get(eventID=moment[i])
                moment_data.click += 1
                moment_data.save()
                moment_str += str(moment[i]).zfill(2)

            user = users.first()
            record = Record.objects.create(openID=user, userName=name, data=time, campus=campus_str, event=moment_str)
            record.save()
            return JsonResponse({'msg': 'ok'})


def get_ticket(request):
    global jsapi_ticket
    global now_time
    if request.method == 'POST':
        var = uuid.uuid4().hex[0:10]
        received_json_data = json.loads(request.body)
        url = urllib.parse.unquote(received_json_data['url'])
        if now_time - time.time() < 3600:
            now_time = int(time.time())
            jsapi_ticket = jsapi_ticket
            string1 = 'jsapi_ticket=' + jsapi_ticket + '&noncestr=' + var + '&timestamp=' + str(
                now_time) + '&url=' + url
            signature = hashlib.sha1(string1.encode('utf-8')).hexdigest()
            return JsonResponse(
                {'data': {'noncestr': var, 'timestamp': str(now_time), 'signature': signature},
                 'msg': '', 'status': 200})
        now_time = int(time.time())
        first_url = 'https://api.weixin.qq.com/cgi-bin/token'
        params = {
            'grant_type': 'client_credential',
            'appid': APPID,
            'secret': APPSECRET
        }
        response = requests.get(url=first_url, params=params)
        json_str = response.content.decode()
        tokenInfo = json.loads(json_str, strict=False)
        if 'errcode' in tokenInfo:
            return HttpResponse(str(tokenInfo["errcode"]) + ' ' + tokenInfo["errmsg"])
        else:
            access_token = tokenInfo['access_token']
            next_url = 'https://api.weixin.qq.com/cgi-bin/ticket/getticket'
            params2 = {
                'access_token': access_token,
                'type': 'jsapi'
            }
            response2 = requests.get(url=next_url, params=params2)
            json_str2 = response2.content.decode()
            tokenInfo2 = json.loads(json_str2, strict=False)
            if 'ticket' not in tokenInfo2:
                return HttpResponse(str(tokenInfo2["errcode"]) + ' ' + tokenInfo2["errmsg"])
            else:
                jsapi_ticket = tokenInfo2['jsapi_ticket']
                string1 = 'jsapi_ticket=' + jsapi_ticket + '&noncestr=' + var + '&timestamp=' + str(
                    now_time) + '&url=' + url
                signature = hashlib.sha1(string1.encode('utf-8')).hexdigest()
                return JsonResponse(
                    {'data': {'noncestr': var, 'timestamp': str(now_time), 'signature': signature},
                     'msg': '', 'status': 200})
