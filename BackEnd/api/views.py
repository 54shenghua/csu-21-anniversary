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
                return JsonResponse({'data': {'openID': openID, 'avatar': avatar}, 'msg': '', 'status': 200})
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
                    return JsonResponse({'data': {'openID': openID, 'avatar': avatar, 'province': province,
                                                  'sex': sex, 'city': city, 'country': country}, 'msg': '',
                                         'status': 200})


def test(request):
    User.objects.create(avatar='hhh')
    return JsonResponse({'msg': 'ok'})


# def click(request):
#     this_event_name = None
#     this_campus_name = None
#     if request.method == 'POST':
#         if request.META.get('HTTP_OPENID') is None:
#             return HttpResponse('请求出错')
#         received_json_data = json.loads(request.body)
#         openid = received_json_data['openid']
#         name = received_json_data['name']
#         time = received_json_data['time']
#         campus = received_json_data['campus']
#         moment = received_json_data['moment']
#         users = User.objects.filter(openid=openid)
#         if not users:
#             return HttpResponse('用户不存在')
#         else:
#             for i in range(0, 6):
#                 if campus[i] == 1:
#                     this_campus = Campus.objects.get(campusID=(i + 1))
#                     this_campus_name = this_campus.campusName
#                     this_campus.click = this_campus.click + 1
#                     this_campus.save()
#                     break
#             for i in range(0, 21):
#                 if moment[i] == 1:
#                     this_event = Event.objects.get(eventID=(i + 1))
#                     this_event_name = this_event.eventName
#                     this_event.click = this_event.click + 1
#                     this_event.save()
#                     break
#             user = users.first()
#             records = Record.objects.filter(openID=user)
#             if not records:
#                 record = Record.objects.create(openID=user, userName=name, data=time, campus=this_campus_name,
#                                                event=this_event_name)
#                 record.save()
#             else:
#                 record = records.first()
#                 record.campus = this_campus_name
#                 record.event = this_event_name
#                 record.data = time
#                 record.userName = name
#                 record.save()
#             return JsonResponse({'msg': 'ok'})

def click(request):
    this_event_name = None
    this_campus_name = None
    if request.method == 'POST':
        received_json_data = json.loads(request.body)
        openid = received_json_data['openid']
        name = received_json_data['name']
        time = received_json_data['time']
        campus = received_json_data['campus']
        moment = received_json_data['moment']
        users = User.objects.filter(openid=openid)
        if not users:
            return HttpResponse('用户不存在')
        else:
            for i in range(len(campus)):
                print(campus[i])
            for i in range(len(moment)):
                print(campus[i])
            # user = users.first()
            # records = Record.objects.filter(openID=user)
            # if not records:
            #     record = Record.objects.create(openID=user, userName=name, data=time, campus=this_campus_name,
            #                                    event=this_event_name)
            #     record.save()
            # else:
            #     record = records.first()
            #     record.campus = this_campus_name
            #     record.event = this_event_name
            #     record.data = time
            #     record.userName = name
            #     record.save()
            return JsonResponse({'msg': 'ok'})
