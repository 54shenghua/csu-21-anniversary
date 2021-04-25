import json

import requests
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render

# Create your views here.
from api.models import User, Record, Campus, Event

APPID = 'wx2fdfc27744ffa252'
APPSECRET = '9da819bd0531b325f5ebda4f85a92503'


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
                    return JsonResponse({'data': {'openid': openID, 'avatar': avatar,}, 'msg': '', 'status': 200})


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
                campus_data = Campus.objects.get(campusID = campus[i])
                campus_data.click += 1
                campus_data.save()
                campus_str += str(campus[i]).zfill(2)

            moment_str = ''
            for i in range(len(moment)):
                moment_data = Event.objects.get(eventID = moment[i])
                moment_data.click += 1
                moment_data.save()
                moment_str += str(moment[i]).zfill(2)
            
            user = users.first()
            record = Record.objects.create(openID=user, userName=name, data=time, campus=campus_str, event=moment_str)
            record.save()
            return JsonResponse({'msg': 'ok'})
