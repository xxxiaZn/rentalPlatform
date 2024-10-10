# Create your views here.
import datetime

from rest_framework.decorators import api_view, authentication_classes
from myapp import utils
from myapp.auth.authentication import AdminTokenAuthtication
from myapp.handler import APIResponse
from myapp.permission.permission import isDemoAdminUser
from myapp.serializers import RepairSerializer
from myapp.models import Repair
from rest_framework.decorators import api_view

@api_view(['GET'])
def list_api(request):
    if request.method == 'GET':
        repairs = Repair.objects.all().order_by('-id')
        serializer = RepairSerializer(repairs, many=True)
        return APIResponse(code=0, msg='查询成功', data=serializer.data)

@api_view(['POST'])
@authentication_classes([AdminTokenAuthtication])
def complete_repair(request):
    if isDemoAdminUser(request):
        return APIResponse(code=1, msg='商家帐号无法操作')

    try:
        pk = request.GET.get('id', -1)
        tags =Repair.objects.get(pk=pk)
    except Repair.DoesNotExist:
        return APIResponse(code=1, msg='对象不存在')

    serializer = RepairSerializer(tags, data=request.data)
    completetime = datetime.datetime.now()
    tags.complete_time = completetime
    if serializer.is_valid():
        serializer.save()
        return APIResponse(code=0, msg='完成维修', data=serializer.data)
    else:
        utils.log_error(request, '参数错误')

    return APIResponse(code=1, msg='更新失败')

