import datetime

from rest_framework.decorators import api_view, authentication_classes
from myapp import utils
from myapp.auth.authentication import TokenAuthtication
from myapp.handler import APIResponse
from myapp.models import Order, Thing, User, Maintainance
from myapp.permission.permission import isDemoAdminUser
from myapp.serializers import OrderSerializer, MaintainanceSerializer


@api_view(['POST'])
@authentication_classes([TokenAuthtication])
def create(request):
    serializer = MaintainanceSerializer(data=request.data)
    if isDemoAdminUser(request):
        return APIResponse(code=1, msg='商家帐号无法操作')

    if serializer.is_valid():
        serializer.save()
        return APIResponse(code=0, msg='创建成功', data=serializer.data)
    else:
        utils.log_error(request, '参数错误')

    return APIResponse(code=1, msg='创建失败')